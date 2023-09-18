import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Ex61 GoogleMap Widget #2'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Completer<GoogleMapController> _controller = Completer();
  // 지도의 최초 중심좌표
  final LatLng _myLoc = const LatLng(37.57979551550774, 126.97706246296076);
  // 마커와 폴리라인의 좌표값을 저장할 리스트
  final List<Marker> _markers = [];
  final List<Polyline> _polylines = [];
  
  // 궁에 대한 위치값 지정
  List<Palace> palaces = [
    Palace("경복궁", const LatLng(37.57979551550774, 126.97706246296076)),
    Palace("경희궁", const LatLng(37.57136511434671, 126.96815224932355)),
    Palace("덕수궁", const LatLng(37.565868063366096, 126.97515644898421)),
    Palace("창덕궁", const LatLng(37.57968911285638, 126.99111100341483)),
    Palace("창경궁", const LatLng(37.578932311976125, 126.99489126244981)),
  ];
  // 마커의 색깔 지정
  List<double> hue = [
    // BitmapDescriptor.hueAzure,
    BitmapDescriptor.hueBlue,
    BitmapDescriptor.hueCyan,
    BitmapDescriptor.hueGreen,
    BitmapDescriptor.hueMagenta,
    // BitmapDescriptor.hueOrange,
    BitmapDescriptor.hueRed,
    // BitmapDescriptor.hueRose,
    // BitmapDescriptor.hueViolet,
    // BitmapDescriptor.hueYellow
  ];

  // 궁의 개수만큼 마커 객체 생성
  void makeMarkerData() {
    int i = 0;
    for (Palace palace in palaces) {
      final marker = Marker(
        markerId: MarkerId(palace.name),
        icon: BitmapDescriptor.defaultMarkerWithHue(hue[i]),
        position: palace.position,
        infoWindow: InfoWindow(
            title: palace.name, // 인포윈도우 제목
            // snippet: "",  // 소제목
            onTap: () {
              print('onTap : ${palace.name}');
            }),
      );
      // 마커 추가
      _markers.add(marker);
      i++;
    }
  }

  // 폴리라인 표시
  void makePolyline() {
    List<LatLng> coordinates = [];
    for (int i = 0; i < palaces.length; i++) {
      coordinates.add(
          LatLng(palaces[i].position.latitude, palaces[i].position.longitude));
    }
    // 폴리라인 속성
    Polyline polyline = Polyline(
        polylineId: const PolylineId("poly"),
        patterns: [PatternItem.dash(10), PatternItem.gap(10)],
        color: Colors.red,
        width: 3,
        points: coordinates);
    // 폴리라인 추가
    _polylines.add(polyline);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    // 앱을 시작할 때 마커와 폴리라인을 앱에 푝시함
    makeMarkerData();
    makePolyline();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: Colors.amber,
            height: 600,
            // width: 400,
            child: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(
                target: _myLoc,
                zoom: 14.0,
              ),
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              markers: Set.from(_markers),
              polylines: Set.from(_polylines),
            ),
          ),
        ],
      ),
    );
  }
}

// VO개체 선언, 값 그자체를 나타내는 객체
// DTO 순수하게 데이터를 담아 계층 간으로 전달하는 객체
class Palace {
  late final String name;
  late final LatLng position;

  Palace(this.name, this.position);
}
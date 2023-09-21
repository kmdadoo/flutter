import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // utf8.decode
import 'package:xml2json/xml2json.dart';
// import 'list_view_page.dart';


void main() {
 runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'COVID19 DATA'),
    );
  }
  }


  class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;


  @override
  _MyHomePageState createState() => _MyHomePageState();
  }


  class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child:
                  const Text('Covid19감염현황(일일)', style: TextStyle(fontSize: 24)),
              onPressed: () {
                _accDataParsing();
              },
            ),
          ],
        ),
      ),
    );
  }


  Future<String> _getRequestData() async {
    // 오늘 날짜 지정
    String startDay = DateTime.now()
        .add(const Duration(days: -1))
        .toString()
        .substring(0, 10)
        .replaceAll('-', '');


    //공공데이터 요청 URL
    String dataUrl =
        "http://apis.data.go.kr/1352000/ODMS_COVID_02/callCovid02Api";
    //파라미터
    String param1 =
        "serviceKey=U6dtTv%2B6W4r%2BqLjWbncBkVoiOL1TA4hTKDZtxir6tda3Vi2quu1uUI88mxp%2FiR9d1%2FIlaKFni6TEZY3TjckddQ%3D%3D";
    String param2 = "pageNo=1";
    String param3 = "numOfRows=10";
    String param4 = "status_dt=$startDay";


    //XML 데이터 받아오기
    var url = Uri.parse("$dataUrl?$param1&$param2&$param3&$param4&");
    http.Response response =
        await http.get(url, headers: {"Accept": "application/json"});


    var statusCode = response.statusCode;
    var responseHeaders = response.headers;
    var responseBody = utf8.decode(response.bodyBytes); // for 한글


    print("statusCode: $statusCode");
    print("responseHeaders: $responseHeaders");
    print("responseBody: $responseBody");
    return responseBody.toString();
  }


  //XML을 JSON으로 변환후 파싱
  void _accDataParsing() async {
    String xmlData = await _getRequestData();
    Xml2Json xml2json = Xml2Json();
    xml2json.parse(xmlData);
    var jsonData = xml2json.toParker();
    print(jsonData);
    var data1 = jsonDecode(jsonData);
    print('데이터 : $data1');
    var data2 = data1['response']['body']['items']['item'];
    print('데이 : $data2');


    print("날짜 : ${data2['statusDt']}");
    print("누적 확진자 : ${data2['hPntCnt']}");
    print("누적 사망자 : ${data2['gPntCnt']}");
  }
}
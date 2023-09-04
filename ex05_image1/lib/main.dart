import 'dart:ui';
import 'package:flutter/material.dart';

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
      home: const MyHomePage(title: 'Ex05 Image #1'),
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
  // 현재 실행한 단말기의 화면크기를 출력하는 메서드
  void getWindowSize() {  // print 로 출력한 결과는 디버그 콘솔에서 확인
    // 앱 화면에 논리적 크기 Ex> Size(411.4, 683.4)
    print(MediaQuery.of(context).size);
   
    // 화면 배율    ex> 2.625
    print(MediaQuery.of(context).devicePixelRatio);

    // 상단 상태 표시줄 높이 double Ex> 24.0
    print(MediaQuery.of(context).padding.top);

    // 앱 화면 실제 크기    Ex>Size(1080.0, 1794.0)
    print(window.physicalSize);
  }

  @override
  Widget build(BuildContext context) {
    getWindowSize();    // 메서드 호출

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        // 정렬 관련된 속성
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // 해당 배율에 이미지가 없으므로 기본 이미지를 사용
          Image.asset(
          'assets/images/300x300a.png',
          ),

          // 해당 배율에 이미지가 있으므로 해당 배율의 분홍 이미지를 사용
          // 기본 폴더에 같은 이름의 이미지는 노란색 이미지
          // 크기를 지정하지 않으면 배율 만큼 자동으로 줄어듬, 노란색 크기만큼
          Image.asset(
            'assets/images/300x300b.png',
          ),

          // 해당 배율의 이미지라도 크기를 지정하면 지정한 크기가 적용됨.
          // Image.asset의 크기가 지정된 것이지 내부의 이미지 크기가 지정된 것은 아니다.
          Image.asset(
            'assets/images/300x300b.png',
            // fit: BoxFit.fill,
            width: 100,  // 액자의 크기를 지정해 주는 것임. 이렇게 지정해서 사용하는 
                        // 것이 좋다.
          ),

          // 기본 폴더의 이미지에 크기 지정하기
          Image.asset(
            'assets/images/300x300a.png',
            width: 100,
          ),
        ]
      ),
    );
  }
}

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
      home: const MyHomePage(title: 'Ex06 Image #2'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(  // 열이 중심이므로
        // 메인 방향으로 가운데 정렬하기, 여기서는 세로
        mainAxisAlignment: MainAxisAlignment.center,
        // 여기서는 가로방향으로 처음 정렬하기
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
          'assets/images/900.png',
          fit: BoxFit.fill,     // 사이즈만 지정하면 자동 설정됨.
          alignment: Alignment.topLeft,
          width: 120.0,         // 원래 사이즈가 비율대로 줄어듬.
          ),
          const SizedBox(height: 5,),   // 간격을 주기위한 것.
          Image.asset(
            'assets/images/900.png',
            fit:BoxFit.cover,     // 큰 쪽에 맞춤. 작은 쪽 잘림
            alignment: Alignment.centerLeft,
            width: 150.0,
            height: 100.0,
          ),
          const SizedBox(height: 5,),
          Image.asset(
            'assets/images/900.png',
            fit:BoxFit.fill,   // 사이즈만 지정하면 자동 설정됨  (위아래가 작아짐) 
            alignment: Alignment.centerLeft,
            width: 150.0,
            height: 100.0,
          ),
          const SizedBox(height: 5,),
          Image.asset(
            'assets/images/900.png',
            fit:BoxFit.contain,   // 작은 쪽에 맞춤. 큰 쪽에 여백 남음
            alignment: Alignment.topLeft,
            // 사이즈를 둘다 주면 fill 이 아니고 contain 이 된다.
            width: 150.0,  
            height: 100.0,
          ),
          const SizedBox(height: 5,),
          Image.asset(
            'assets/images/900.png',
            // fit:BoxFit.contain,
            alignment: Alignment.topLeft,  
            width: 150.0,  
            height: 100.0,  
          ),
          const SizedBox(height: 5,),
          Image.asset(
            'assets/images/900.png',
            fit:BoxFit.none,    // 원래 크기. 화면 배율 영향 안 받음.
            alignment: Alignment.topLeft, // 오른쪽, 아래쪽 잘림
            width: 320.0,   // 옵션은 한줄에 하나씩 하는 것이 수정할 대 편함.
            height: 50.0,
          ),
        ],
      ),
    );
  }
}

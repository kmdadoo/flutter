import 'package:flutter/material.dart';

// 앱 시작 부분
void main() {
  runApp(const MyApp());
}

// 시작 클래스. 머티리얼 디자인 앱 생성
class MyApp extends StatelessWidget {   // 상태변화가 없는 애
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

// 시작 클래스가 표시되는 클래스. 카운터 앱 화면
class MyHomePage extends StatefulWidget {   // 상태가 변하는 애, 정보가 변함
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// 위 MyHomePage 클래스의 상태를 나타내는 State클래스
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;   // 화면에 표시할 상태값인 카운터 숫자

  // counter 변수를 1 증가시키고 화면을 다시 그리는 메서드
  void _incrementCounter() {
    setState(() {   // 화면을 다시 그리도록 하는 함수. StatefulWidget만 가능
      _counter++;   
    });
  }

  // 화면에 UI를 그리는 메서드. 그려질 위젯을 반환
  @override
  Widget build(BuildContext context) {
    return Scaffold(  // 머티리얼 디자인 기본 뼈대 위젯
      appBar: AppBar( // 상단 앱바
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center( // 표시할 내용
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',    // _counter 변수를 표시
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // 클릭시 _incrementCounter() 메서드 실행
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),     // 하단 + 버튼
      ), 
    );
  }
}

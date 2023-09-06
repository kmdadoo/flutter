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
      home: const MyHomePage(title: 'Ex11 Stackuse'),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            getStack1(),
            const SizedBox(height: 10,),
            getStack2(),
            const SizedBox(height: 10,),
            getStack3(),
            const SizedBox(height: 10,),
            getStack4(),
          ],
        ),
      ),
    );
  }

  Widget getStack1(){
    return Stack(
      // fit: StackFit.expand,
      // alignment: AlignmentDirectional.bottomCenter,
      children: [
        Container(
          width: 120,
          height: 120,
          color: Colors.red,
        ),
        Container(    // 크기만 지정하였을 때는 좌측 상단 시작 지점 같음. alignment 주석처리했을때
          width: 60,
          height: 60,
          color: Colors.blue,
        ),
      ],
    );
  }

  Widget getStack2(){
    return Stack(
      // fit: StackFit.expand,
      // alignment: AlignmentDirectional.bottomCenter,  
      children: [
        Container(
          width: 120,
          height: 120,
          color: Colors.red,
        ),
        Positioned(   // 시작위치를 바꿀때 사용
          top: 30,
          left: 30,
          child: Container(
            width: 60,
            height: 60,
            color: Colors.blue,
          ),
        ),
      ],
    );
  }

  Widget getStack3(){
    return Stack(
      // fit: StackFit.expand,
      // alignment: AlignmentDirectional.bottomCenter,  
      children: [
        Container(
          width: 120,
          height: 120,
          color: Colors.red,
        ),
        Positioned(   // 시작위치를 바꿀때 사용
          top: 30,
          left: 30,
          // 아래의 container의 크기가 무시된다. 위 부모보다 큰 크기는 짤린다.
          width: 120,
          height: 120,
          child: Container(
            width: 60,
            height: 60,
            color: Colors.blue,
          ),
        ),
      ],
    );
  }

  Widget getStack4(){
    return Stack(
      clipBehavior: Clip.none, // 기본은 hardEdge
      // fit: StackFit.expand,
      // alignment: AlignmentDirectional.bottomCenter,  
      children: [
        Container(
          width: 120,
          height: 120,
          color: Colors.red,
        ),
        Positioned(   // 시작위치를 바꿀때 사용
          top: 30,
          left: 30,
          // 아래의 container의 크기가 무시된다. 위 부모보다 큰 크기는 짤린다.
          // clipBehavior로 전체를 다 표형 할 수 있다.
          width: 120,
          height: 120,
          child: Container(
            width: 60,
            height: 60,
            color: Colors.blue,
          ),
        ),
      ],
    );
  }
}

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
      home: const MyHomePage(title: 'Ex10 Layout'),
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
      /*
        위젯을 감쌀필요가 있는 경우 Ctrl + .을 사용한다.
       */
      body: SafeArea(
        child: Container(
          color: Colors.orange,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.yellow,
                  width: 300,
                  height: 100,
                  child: Row(       // 가로형 배치
                    mainAxisAlignment: MainAxisAlignment.center,  // 가로에 가운대 배치
                    mainAxisSize: MainAxisSize.max,
                    // children : 2개 이상의 위젯을 배치할 때 사용
                    // child : 1개의 위젯을 배치할 때 사용
                    children: [
                      ElevatedButton(child: const Text('Button'),onPressed: () {},),
                      // const SizedBox(width: 10,),    // 위젯사이의 간격 조정
                      const Spacer(flex: 1,),     // 위젯의 전체적인 배치 조정, 비율
                      ElevatedButton(child: const Text('Button'),onPressed: () {},),
                      // const SizedBox(width: 10,),
                      const Spacer(flex: 2,),
                      ElevatedButton(child: const Text('Button'),onPressed: () {},),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.cyan,
                  width: 300,
                  height: 100,
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Row(     // 가로형 배치
                    mainAxisAlignment: MainAxisAlignment.center, 
                    // 수직방향에서 아래쪽 정렬
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ElevatedButton(child: const Text('Button'),onPressed: () {},),
                      // const SizedBox(width: 10,),
                      const Spacer(flex: 1,),
                      ElevatedButton(child: const Text('Button'),onPressed: () {},),
                      // const SizedBox(width: 10,),
                      const Spacer(flex: 2,),
                      ElevatedButton(child: const Text('Button'),onPressed: () {},),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
      home: const MyHomePage(title: 'Ex07 Button Deco'),
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
  String name = "클릭하세요!";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Text(
            '$name',    // 믄자열 표현식만 있는 경우 $을 사용하지 마십시오.=> name
            // 자동으로 지정되는 영문과 한글의 글자 높이가 달라서 지정
            style: const TextStyle(fontSize: 30, height: 1.5),
          ),
          // TextButton 은 눈에 보이는 경계가 없다.
          TextButton(
            child: const Text('TextButton',
                style: TextStyle(fontSize: 24, 
                                  color: Colors.red)),
            onPressed: () {
              // 직접 구현
              setState(() {
                name = "전우치";
              });
            },
          ),
          TextButton.icon(
            icon: const Icon(Icons.add_circle, size: 24.0),
            label: const Text('TextButton + icon',
                style: TextStyle(fontSize: 24, 
                                  color: Colors.red)),
            style: TextButton.styleFrom(  // 클릭했을시 나오는 색깔을 지정할수 있다.
              foregroundColor: Colors.blue, 
            ),
            onPressed: () {
              setState(() {
                name = "전우치(icon)";
              });
            },
          ),
          TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white, 
                backgroundColor: Colors.teal,
                textStyle:
                    const TextStyle(fontSize: 20, 
                                    fontStyle: FontStyle.italic),
                shadowColor: Colors.red,
                elevation: 5,
                side: const BorderSide(color: Colors.red, width: 1),
                shape: const BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))),
              ),
              onPressed: () {
                // 직접 구현
                setState(() {
                  name = "전우치(back-color)";
                });
              },
              child: const Text('TextButton')),
          
          // ElevatedButton과 TextButton사이의 강도를 가지는 위젯
          OutlinedButton(
              child: const Text('OutlineButton',
                  style: TextStyle(fontSize: 24, 
                                    color: Colors.blue)),
              onPressed: () {
                _onClick1(1); // 함수 호출
              }),
          OutlinedButton.icon(
              icon: const Icon(Icons.web, size: 24.0),
              label: const Text('OutlineButton',
                  style: TextStyle(fontSize: 24, 
                                    color: Colors.red)),
              onPressed: () {
                _onClick1(2); // 함수 호출
              }),
          OutlinedButton(
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white, 
                backgroundColor: Colors.teal,
                textStyle:
                    const TextStyle(fontSize: 20, 
                                    fontStyle: FontStyle.italic),
                shadowColor: Colors.red,
                elevation: 5,
                side: const BorderSide(color: Colors.red, width: 1),
                shape: const BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))),
              ),
              onPressed: () {
                _onClick1(3); // 함수 호출
              },
              child: const Text('OutlineButton')),

          ElevatedButton(
            child: const Text('ElevatedButton',
                style: TextStyle(fontSize: 24, 
                                  color: Colors.black38)),
            onPressed: () => _onClick1(4), // 함수 호출
          ),
          ElevatedButton.icon(
            icon: const Icon(Icons.web, size: 24.0),
            label: const Text('ElevateButton',
                style: TextStyle(fontSize: 24, 
                                  color: Colors.black38)),
            onPressed: () => _onClick1(5), // 함수 호출
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white, 
              backgroundColor: Colors.green,
              textStyle:
                  const TextStyle(fontSize: 20, 
                                  fontStyle: FontStyle.italic),
              shadowColor: Colors.red,
              elevation: 5,
              side: const BorderSide(color: Colors.red, width: 1),
              shape: const BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5))),
            ),
            onPressed: () => _onClick1(6),
            child: const Text('ElevatedButton'), // 함수 호출
          ),

          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.add_box),
                iconSize: 60.0,
                color: Colors.blue,
                tooltip: "툴팁입니다.",
                onPressed: _onClick2, // 함수 이름을 대입
              ),
              IconButton(
                icon: Image.asset('assets/images/300x100.png', width: 100,),
                tooltip: "툴팁입니다.",
                onPressed: () => _onClick2(),
              ),
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _onClick3(),
        tooltip: '앱에서는 롱터치에 툴팁을 보여줍니다.',
        child: const Icon(Icons.add),
      ),
    );
  }

  void _onClick1(int kind) {
    setState(() {
      switch (kind) {
        case 1: name = "홍길동"; break;
        case 2: name = "홍길동(icon)"; break;
        case 3: name = "홍길동(back-color)"; break;
        case 4: name = "손오공"; break;
        case 5: name = "손오공(icon)"; break;
        case 6: name = "손오공(back-color)"; break;
        default:
      }
    });
  }

  void _onClick2() {
    setState(() {
      name = "해리포터";
    });
  }

  void _onClick3() {
    setState(() {
      name = "클릭하세요!";
    });
  }
}
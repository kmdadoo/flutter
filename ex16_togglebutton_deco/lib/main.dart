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
      home: const MyHomePage(title: 'Ex15 Toggle Button'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> 
{
  //토글버튼에서 사용할 리스트
  var isSelected1 = [false, false, true];
  var isSelected2 = [false, false, true];
  var isSelected3 = [false, false, true];

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
          children: <Widget>[
            // multi-select
            const Text('multi-select', textScaleFactor: 2),
            ToggleButtons(
              //이벤트리스너 : 누른 버튼의 인덱스가 매개변수로 전달됨.
              onPressed: (int index) {
                setState(() {
                  //!가 변수 앞에 있으므로 Not연산자임(주의)
                  isSelected1[index] = !isSelected1[index];
                  print('isSelected1 : $isSelected1');
                  print('index : $index');
                });
              },
              //각 버튼의 값으로 사용할 List설정
              isSelected: isSelected1,
              //각 버튼의 아이콘을 설정
              children: const [
                Icon(Icons.ac_unit),
                Icon(Icons.call),
                Icon(Icons.cake),
              ],
            ),
            const SizedBox(height: 20),
            // single select
            const Text('single select', textScaleFactor: 2),
            ToggleButtons(
              onPressed: (int index) {
                setState(() {
                  //항목중 하나만 선택할 수 있도록 for문으로 처리
                  for (var i = 0; i < isSelected2.length; i++) {
                    if (i == index) {
                      //선택한 항목만 활성화
                      isSelected2[i] = true;
                    } else {
                      //나머지는 비활성화 시킴
                      isSelected2[i] = false;
                    }
                  }
                  print('isSelected2 : $isSelected2');
                });
              },
              isSelected: isSelected2,
              children: const [
                Icon(Icons.ac_unit),
                Icon(Icons.call),
                Icon(Icons.cake),
              ],
            ),
            // fancy
            const Text('fancy', textScaleFactor: 2),
            ToggleButtons(
              borderColor: Colors.blueGrey,
              borderWidth: 10,
              selectedBorderColor: Colors.blue,
              splashColor: Colors.yellowAccent, // 선택될 때 잠시 보인다.
              color: Colors.red, // 노멀 상태 그림의 색
              selectedColor: Colors.green, // 선택된 그림의 색
              fillColor: Colors.yellow, // 선택된 버튼의 배경색
              borderRadius: BorderRadius.circular(10),  // 제대로 적용 안됨
              onPressed: (int index) {
                setState(() {
                  for (int i = 0; i < isSelected3.length; i++) {
                    if (i == index) {
                      isSelected3[i] = true;
                    } else {
                      isSelected3[i] = false;
                    }
                  }
                  print('isSelected3 : $isSelected3');
                });
              },
              isSelected: isSelected3,
              children: const [
                Icon(Icons.ac_unit),
                Icon(Icons.call),
                Text('cake'), //아이콘 대신 텍스트도 설정 가능
              ],
            ),
          ],
        ),
      ),
    );
  }
}
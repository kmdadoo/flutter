import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {   // 여기서 테마 선언
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // theme: ThemeData.dark(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        // 선택되지 않은 라디오 버튼 색깔
        unselectedWidgetColor: Colors.green,
        scaffoldBackgroundColor: Colors.yellow[50],
        fontFamily: 'D2Coding',
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            // button
            fontSize: 25,
            height: 1.5,
            color: Colors.indigo,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: const MyHomePage(title: 'Ex18 Theme'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum Fruit { apple, banana }

class _MyHomePageState extends State<MyHomePage> {
  Fruit _myGroup = Fruit.banana;
  bool _chk1 = false;
  bool _chk2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,  // useMaterial3
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '디폴트 테마가 적용된 글자',
            ),
            TextButton(
              onPressed: () => print('aaa'),
              child: const Text('TextButton 0',
                style: TextStyle(fontSize: 24, color: Colors.red)),
            ),
            ElevatedButton(
              child:
                  const Text('디폴트 테마 - 버튼 0', style:                        
                                     TextStyle(fontSize: 24)),
              onPressed: () {
                print('bbb');
              },
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // 테두리색
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(
                      fontSize: 20, fontStyle: FontStyle.italic),
                  shadowColor: Colors.blueAccent,
                  elevation: 5,
                  side: const BorderSide(color: Colors.red, width: 1),
                  shape: const BeveledRectangleBorder(
                      borderRadius: // 네모끝
                         BorderRadius.all(Radius.circular(10))),
                ),
                onPressed: () {
                  print('ccc');
                },
                child: const Text('글자색 변경 - 버튼 0',
                    style: TextStyle(fontSize: 24,
                                      color: Colors.white))),
            RadioListTile<Fruit>(
              title: const Text('사과'),  // 테마에서
              groupValue: _myGroup,
              value: Fruit.apple,
              onChanged: (Fruit? value) {
                setState(() {
                  _myGroup = value!;
                  print(_myGroup);
                });
              },
            ),
            Theme(
              data: Theme.of(context).copyWith(
                unselectedWidgetColor: Colors.indigo,
              ),
              child: RadioListTile<Fruit>(
                title: const Text('바나나'),
                groupValue: _myGroup,
                value: Fruit.banana,
                activeColor: Colors.pink, // 체크되었을 때 색
                onChanged: (value) {
                  setState(() {
                    _myGroup = value!;
                    print(_myGroup);
                  });
                },
              ),
            ),
            Checkbox(
                value: _chk1,
                checkColor: Colors.pink, // 체크되었을 때 마크의 색
                activeColor: Colors.green, // 체크되었을 때 배경색
                // 노멀 상태의 배경색은 테마로 변경
                onChanged: (value) { // 위에서 bool?처리했기때문에 이곳에서는 안씀
                  setState(() {
                    _chk1 = value!;
                  });
                }),
            Theme(
              data: Theme.of(context).copyWith(
                unselectedWidgetColor: Colors.red,  // 두번째 테두리색
              ),
              child: Checkbox(
                value: _chk2,
                checkColor: Colors.pinkAccent, // 체크되었을 때 마크의 색
                activeColor: Colors.greenAccent, // 체크되었을 때 배경색
                onChanged: (value) { // 위에서 bool?처리했기때문에 이곳에서는 안씀
                  setState(() {
                    _chk2 = value!;
                  });
                },
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.thumb_up),
        label: const Text('Approve'),
        tooltip: 'Increment', //버튼을 길게 누르면 나옴
        backgroundColor: Colors.purple,
        onPressed: () {
          print('ddd');
        },
      ),
      
      // floatingActionButton: Theme(
      //   data: ThemeData(
      //     colorScheme: ColorScheme.fromSwatch()
      //              .copyWith(secondary: Colors.purple),
      //   ),
      //   child: FloatingActionButton(
      //     child: const Icon(Icons.add),
      //     tooltip: 'Increment',
      //     onPressed: () => (print('ddd')),
      //   ),
      // ),
    ); // Scaffold
  }
}
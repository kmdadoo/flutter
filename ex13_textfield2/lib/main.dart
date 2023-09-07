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
      home: const MyHomePage(title: 'Ex13 Textfield #2'),
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
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              '내용을 입력하세요',
              style: TextStyle(fontSize: 30),
            ),
            /*
              텍스트필드를 멀티라인으로 사용하는 경우 화면사이즈를 넘어가면 제대로 표혀되지
              않으므로 이때는 Expanded위젯으로 감싸준다. 이때 Ctrl + .을 사용하면 된다.
              (지울때도 마찬가지)
             */
            Expanded(
              child: TextField(
                // maxLength를 추가하면 자동적으로 아래에 couter가 생성된다.
                maxLength: 100,  // 입력할 문자열의 길이
                maxLines: 30,   // 30줄로 설정
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.greenAccent, width: 1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 1.0),
                  ),
                  // labelText: '내용입력',
                  // counterText: "",   // 주석처리하지 않으면 카운터가 없어진다.
                  counterStyle: TextStyle(
                    fontSize: 20.0,
                    color: Colors.red
                  ),
                ),
                onChanged: (text) {
                  print(text);
                },
                onSubmitted: (text) {
                  print('Submitted : $text');
                },
              ),
            ),
            ElevatedButton(
              child: const Text('키보드 내리기',
                                style: TextStyle(fontSize: 24,
                                                 color: Colors.black54)),
              onPressed: () => _onClick(),
            ),
          ],
        ),
      ),
    );
  }

  void _onClick() {
    FocusScope.of(context).unfocus();
  }
}

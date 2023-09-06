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
      home: const MyHomePage(title: 'Ex12 Text Field #1 Deco'),
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
  // 전역변수(멤버변수)를 private으로 선언
  int _count = 0;
  String _myText = "TextField 사용 예제입니다.";
  
  // 입력값을 얻어오기 위한 컨트롤러 생성
  final ctlMyText1 = TextEditingController();
  final ctlMyText2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(      // 세로형 배치
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // 택스트위젯 : 텍스트 출력
            Text(
              _myText,
              style: const TextStyle(fontSize: 30.0),
            ),
            const SizedBox(     // 간단한 간격 설정
              height: 20,
            ), 
            TextField(      // 입력값이 없는 텓스트 필드
              controller: ctlMyText1,  
            ),
            const SizedBox(
              height: 20,
            ),
            // 입력된 텍스트의 길이를 출력하는 용도(개발자 정의)
            Text(
              '$_count / 10',
              style: const TextStyle(
                fontSize: 30.0,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(   // 텍스트칠드의 너비를 SizedBox를 통해 지정한다.
              width: 240,
              child: TextField(
                controller: ctlMyText2,
                cursorColor: Colors.red,  // 커서의 컬러 지정
                // cursorWidth: 4.0,        // 두께 지정
                // maxLength를 추가하면 자동적으로 아래에 counter가 생성된다.
                maxLength: 10,              // 입력할 문자열의 최대 길이
                obscureText: true,          // 입력문자 숨김 옵션
              enabled: true,                // 활성화 / 비활성화
                // 키보드 타입 설정
                // keyboardType: TextInputType.emailAddress,
                // keyboardType: TextInputType.number,
                // keyboardType: TextInputType.phone,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  // border: InputBorder.none,
                  // border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.greenAccent, width: 1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 1.0),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  prefixIcon: Icon(Icons.perm_identity),
                  // prefixText: 'Pw',
                  labelText: 'Password',    // 힌트
                  helperText: '비밀번호를 입력하세요',  // 박스 아래쪽 안내문구
                  // 주석을 풀면 카운터가 없어진다.
                  // counterText: '',
                  counterStyle: TextStyle(
                    fontSize: 30.0,
                    color: Colors.red,
                  ),
                ),
                
                // 입력값이 변할때마다 이벤트가 발생된다.
                onChanged: (text) {
                  // 해당 메서드에서 변수가 변화하면 화면이 재렌더링 된다.
                  setState(() {
                    _count = text.length;
                  });
                  print('$text - $_count');
                },
                // 포커싱된 상태에서 엔터키를 누를때 이벤트 발생된다.
                onSubmitted: (text) {
                  print('Submitted : $text');
                },
              ),
            ),
            // 빈 텍스트를 통해 설정하므로, 텍스트를 지우는 효과가 발생됨.
            OutlinedButton(
              child: const Text(
                'Text 입력버튼',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              onPressed: () {
                setState(() {
                  _myText = ctlMyText1.text;
                });
              },
            )
          ],
        ),
      ),
      
      // 플로팅 버튼을 누르면 페스워드 입력값이 텍스트 위젯에 적용된다. 
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _myText = ctlMyText2.text;
          });
        },
        tooltip: 'TextFiend Submit',
        child: const Icon(Icons.send),
      ),
    );
  }
}
import 'package:ex42_route/page1.dart';
import 'package:ex42_route/page2.dart';
import 'package:ex42_route/page3.dart';
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
      /*
        home과 initialRoute를 동시에 사용하면 home은 무시된다.
        즉 우선 순위가 느리므로 동시에 사용하지 않는다.
       */
      // home: Page1(title: '시작1'),   // 앱 첫 실행시 첫패이지를 지정
      initialRoute: '/page1',   // 첫번째 페이지 보여주기
      // 각각의 페이지를 생성자 호출을 통해 지정
      // 이름을 미리 만들어 놓은 것을 route라고 함.
      routes: {  // 순서, 방향, 각 페이지를 생성자 호출을 통해 지정
        // data라는 파라미터에 '시작'값을 전달한다.
        // 쓰는 사람이 있음. 선배중 잉요하면 사용.
        '/page1' :(context) => Page1(data: '시작'),  // <- 실제로 이것을 불러라
        '/page2' :(context) => Page2(data: '1페이지에서 보냄 (1->2)'),
        '/page3' :(context) => Page3(data: '1페이지에서 보냄 (1->3)'),
      },
    );
  }
}

import 'package:ex41_navigator3/page3.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Page2 extends StatefulWidget {
  // 파라미터를 전달받을 전역변수와 생성자 추가 부분
  String data = '';
  Page2({super.key, required this.data});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Page 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // pop() 메서드로 페이지를 스택에서 제거하고, 파라미터를 보낸다.
            ElevatedButton(
              child: const Text('2페이지 제거', style: TextStyle(fontSize: 24)),
              onPressed: () {
                Navigator.pop(context, '2페이지에서 보냄 (Pop)');
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple.shade100,
              ),
              onPressed: () {
                // 화면을 전환하면서 파라미터 전달. 이경우 1페이지로 다시 
                // 돌아가더라도 텍스트 위젯에 메세지가 출력되지 않는다.
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2) => Page3(
                      data: '2페이지에서 보냄 (Replacement)',
                    ),
                    transitionDuration: const Duration(seconds: 0),
                  ),
                );
              },
              child: const Text('3페이지로 변경', style: TextStyle(fontSize: 24)),
            ),
            // 파라미터로 정달받은 값을 텍스트 위젯에 출력
            Text(widget.data, style: const TextStyle(fontSize: 30)),
          ],
        ),
      ),
    );
  }
}
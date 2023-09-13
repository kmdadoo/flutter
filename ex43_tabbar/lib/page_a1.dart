import 'package:flutter/material.dart';
import 'page_a2.dart';

class PageA1 extends StatefulWidget {
  const PageA1({super.key});

  @override
  State<PageA1> createState() => _PageA1State();
}

class _PageA1State extends State<PageA1> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Page A-1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Page A-1', style: TextStyle(fontSize: 30)),
            const SizedBox(height: 30,),
            ElevatedButton(
              child: const Text('2페이지 추가',
                                style: TextStyle(fontSize: 24)),
              onPressed: () {        
                Navigator.push(
                  context,
                  // MaterialPageRoute(builder: (context) => const PageA2()),
                  PageRouteBuilder(
                    pageBuilder: (context, anim1, anim2) => const PageA2(),
                    transitionDuration: const Duration(seconds: 0),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
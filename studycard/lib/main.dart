import 'package:flutter/material.dart';
import 'flippable_box.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigoAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Study Card'),
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
  bool _isFlipped = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () => setState(() => _isFlipped = !_isFlipped),
          child: FlippableBox(
            front: _buildCard("Front!", 250, 200, Colors.green),
            back: _buildCard("Back...", 250, 200, Colors.red),
            flipVt: true,
            isFlipped: _isFlipped,
          ),
        ),
      ),
    );
  }

  // Widget을 Container로 바꿈.
  Container _buildCard(String label, double width, double height, Color color) {
    return Container(
      color: color,
      width: width,
      height: height,
      child: Center(
        child: Text(label, style: const TextStyle(fontSize: 32)),
      ),
    );
  }
}

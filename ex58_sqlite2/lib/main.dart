import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

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
      home: const MyHomePage(title: 'Ex58 Sqlite #2'),
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
  // 데이터베이스 객체 선언
  late Future<Database> database;

  @override
  void initState() {
    super.initState();
    database = getDB();
  }

  // DB가 존재하지 않는 경우, 미리 준비한 DB를 복사하여 사용
  // 테스트시 에러가 발생하면 DB가 만들어지므로 앱을 삭제하고 다시 테스트

  Future<Database> getDB() async {
    // 시스템(루트)경로를 얻어온 후 mytest.db를 찾는다.
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, 'mytest.db');
    var exists = await databaseExists(path);
    // mytest.db가 없다면 우리가 준비한 db를 사용한다.
    if (!exists) {
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      var data = await rootBundle.load(join('assets/database', 'original.db'));
      List<int> bytes = data.buffer.asUint8List(
        data.offsetInBytes,
        data.lengthInBytes,
      );

      await File(path).writeAsBytes(bytes, flush: true);
    }
    // 데이터베이스 파일을 오픈합니다.
    return await openDatabase(path);
  }

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
            ElevatedButton(
              child: const Text(
                'select',
                style: TextStyle(fontSize: 24),
              ),
              onPressed: () => doSelectAll(),
            ),
          ],
        ),
      ),
    );
  }

  void doSelectAll() async {
    // 데이터베이스 reference를 얻기
    final Database db = await database;
    List<Map> datas = await db.rawQuery('select * from family');
    if (datas.isNotEmpty) {
      for (int i = 0; i < datas.length; i++) {
        String name = datas[i]['name'];
        int age = datas[i]['age'];
        String relation = datas[i]['relation'];

        print('$name $age $relation');
      }
    } else {
      print('SelectAll : 데이터가 없습니다. ');
    }
  }
}
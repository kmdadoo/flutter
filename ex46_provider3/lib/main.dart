import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

// 데이터로 사용할 클래스 정의
class MyData extends ChangeNotifier {
  // 초기값 설정 vo객체
  String name = '홍길동';
  int age = 25;

  // 데이터 변경시 호출할 메소드 정의
  void change(String name, int age) {
    // 로그 및 갑 설정
    print('change called...');
    this.name = name;
    this.age = age;
    
    // 데이터 변경 후 호출하면 변경을 반영할 수 있다.
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp을 ChangeNotifierProvider로 감싼다.
    return ChangeNotifierProvider<MyData>(
      // 공유할 데이터를 생성
      create: (_) => MyData(),
      child: MaterialApp(  
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        // 앱이 실행되면 Page1이 로드된다.
        home: const Page1(),
      ),
    );
  }
}

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
 
  late MyData myData;

  @override
  Widget build(BuildContext context) {
    
    /**
     * 데이터사용 : 변경에 대한 알림을 받지 않기로 설정
     *    이 경우 데이터 변경이 있더라도 즉시 build되지 않는다.
     */
    myData = Provider.of<MyData>(context, listen: false);
    print("Page1 빌드됨...");

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Page 1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('2페이지 추가', style: TextStyle(fontSize: 24)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Page2()),
                );
              },
            ),
            const SizedBox(height: 50,),
            /**
             *  아래 버튼을 누르면 기존의 데이터가 변경된다. 변경을
             *  위해 공유객체의 change()를 호출한다.
             */
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.greenAccent,
              ),
              onPressed: () {
                myData.change('전우치1', 30);
              },
              child: const Text('전우치로', style: TextStyle(fontSize: 24)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.greenAccent,
              ),
              onPressed: () {
                myData.change('홍길동1', 25);
              },
              child: const Text('홍길동으로', style: TextStyle(fontSize: 24)),
            ),
            const SizedBox(height: 50,),
            // 처음 빌드될때의 데이터로 표시된다.
            Text(
              '${myData.name} - ${myData.age}',
              style: const TextStyle(fontSize: 30)
            ),
            
            /**
             *  데이터 사용 - 데이터 변경이 일어나면  builder에 저장된 익명함수
             *      가 호출되고 지정된 위젯만 재빌드 된다.
             */
            Consumer<MyData>(
              builder: (context, myData, child) {
                print('Consumer<MyData> 여기도 빌드됨');
                return Text('${myData.name} - ${myData.age}', 
                        style: const TextStyle(fontSize: 30));
              }
            ),
          ],
        ),
      ),
    );
  }
}

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  late MyData myData;

  @override
  Widget build(BuildContext context) { 
    /**
     *  데이터 사용 - 변경에 대한 알림을 받도록 설정 데이터 변경이
     *    있을 때마다 알림을 받아 페이지가 재빌드 된다.
     */
    myData = Provider.of<MyData>(context, listen: true);
    print("Page2 빌드됨...");

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Page 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple[100],
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('2페이지 제거', style: TextStyle(fontSize: 24)),
            ),
            const SizedBox(height: 50,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.greenAccent,
              ),
              onPressed: () {
                myData.change('전우치2', 31);
              },
              child: const Text('전우치로', style: TextStyle(fontSize: 24)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.greenAccent,
              ),
              onPressed: () {
                myData.change('홍길동2', 26);
              },
              child: const Text('홍길동으로', style: TextStyle(fontSize: 24)),
            ),
            const SizedBox(height: 50,),
            // 바뀐 데이터를 처리하기 위해 전체를 다시 빌드해야한다.
            Text(
              '${myData.name} - ${myData.age}',
              style: const TextStyle(fontSize: 30)
            ),
            // 데이터 사용 - 데이터 변경이 일어나면 bilder에 지정된 익명 함수가
            //    호출되고 지정된 위젯만 재 빌드 된다.  
            Consumer<MyData>(
              builder: (context, myData, child) {
                return Text('${myData.name} - ${myData.age}', 
                          style: const TextStyle(fontSize: 30));
              }
            ),
          ],
        ),
      ),
    );
  }
}
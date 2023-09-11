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
      home: const MyHomePage(title: 'Ex28 List View #3'),
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
  //나중에 초기화 될것임을 명시함. 데이터로 사용할 컬렉션.
  late List<Person> persons;

  // 위젯 초기화시 딱 한번만 호출되는 함수로
  // 변경했을때 Hot reload가 지원되지 않으므로 재시작해야 한다.
  @override
  void initState() {  // 더미데이터
    super.initState();

    persons = []; // 초기화
    //데이터로 사용하기 위한 반복
    for(int i=0; i<15; i++){
      persons.add(Person(i+21, '홍길동$i', true));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
       
      body: 
        // 3. ListView.separated를 사용해서 Lazy 하게 생성.
          //    아이템 사이의 구분선도 Lazy 하게 생성.
        ListView.separated(
          itemCount: persons.length,
          itemBuilder: (BuildContext context, int index) {
            // Person 객체외에 추가데이터인 index를 사용한다.
            return PersonTile(persons[index], index);
          },
          separatorBuilder: (BuildContext context, int index){
            return const Divider(     // 구분선
              color: Colors.black,   // Colors.transparent
              height: 1,   // 구분선은 해당 속성에 따라 다른 결과를 출력한다.
              thickness: 1.0,
            );
          },
        ),
    );
  }
}

// 데이터로 사용할 클래스 ==========================================
class Person {
  int age;
  String name;
  bool isLeftHand;

  Person(this.age, this.name, this.isLeftHand);  // 생성자
}

// PersonTile 정의 

class PersonTile extends StatelessWidget {
  final Person _person;
  final int index;  // 타일에 추가 데이터가 필요한 경우 생성자에 추가하면 된다.
  const PersonTile(this._person, this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    /*
      리스트 타일에 배경색을 부여하고 싶을 때는 Container로 감싼후 (Ctrl + .)    
     */
    return Container( // 교안에서 추가한 부분
      color: Colors.amber, 
      child: ListTile(
        leading: const Icon(Icons.person),
        title: Text(_person.name),
        subtitle: Text("${_person.age}세"),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          print('추가 데이터 : $index');
        },
      ),
    );
  }
}
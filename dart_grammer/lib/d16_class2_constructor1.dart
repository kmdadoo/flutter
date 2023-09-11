class Unit
{
  // 사용되기 직전에 초기화가 진행 될것이라는 표시
  late String name;  // late가 없으면 에러 String? 해도 됨
  late int age;

  // 기본 생성자 :  <-- 이름 없는 생성자
  //  -  클래스명과 동일.
  //  -  인자 없다.
  //  -  부모 클래스의 기본 생성자 호출.
  //  -  이름 있는 생성자가 없다면 자동으로 호출된다.

  // 기본 생성자에 수행 동작 추가
  Unit() {
    this.name = "홍길동";
    this.age = 10;
  }

  // 이름 있는 생성자 추가 사용 : 클래스명.생성자명
  // 오버로딩이 안되기 때문에 이렇게 사용함. 필수
  Unit.init1(name) {
    this.name = name;
    this.age = 10;
  }

  Unit.init2(name, age) {
    this.name = name;
    this.age = age;
  }
}

void main()
{
  // 이름 있는 생성자 사용시, 기본 생성자를 사용하려면
  // 기본 생성자를 명시적으로 선언해야 한다. (자바도 동일)
  Unit myUnit1 = Unit();

  Unit myUnit2 = Unit.init1("마린");

  Unit myUnit3 = Unit.init2("마린", 30);

  // 초기화 리스트
  // 리다이렉팅 생성자
  // 상수 생성자
  // 팩토리 생성자
  // 다트가 아니고 플러터를 배울 것이므로 생략
}
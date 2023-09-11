//2개의 추상클래스 또는 인터페이스 선언
abstract class Greet {
  greet();
}
abstract class Talk {
  talk();
}

// 하나만 상속 가능. 추상클래스로 사용.
class Morning extends Greet //, Talk
{
  greet() { print("인사"); }
}

// 여러개 구현 가능. 인터페이스로 사용.
class Evening implements Greet, Talk
{
  greet() { print("인사"); }
  talk() { print("대화"); }
}

void main()
{
  Morning m = Morning();
  m.greet();

  Evening e = Evening();
  e.greet();
  e.talk();
}
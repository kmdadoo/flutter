// 메서드에 반환 타입 형태로 future객체를 사용. 나중에 결과를 준다는 의미
Future<int> myRequest1(num){    // 미래에 <int> 반환한다.
  return Future(() {
    int rNum = 0;
    // 전달된 인수만큼 반복하므로 시간이 걸니는 작업이라 가정한다.
    for(int i=0 ; i<=num ; i++)
    {
      rNum = rNum + i;
    }
    return rNum;
  });
}

// 비동기를 사용하는 경우. 결과가 오기전에 화면이 구현하는 것.
void main(){
  print("main시작1-1");
  // 메서드 호출 후 Future<int>객체를 반환한다.
  var myReq1 = myRequest1(1000);    // 결과를 기다리 않고 다음 진행
  print(111); // print들이 먼저 실행 됨.
  myReq1.then( (data) {
    // 결과가 도작하면 나중에 출력한다.
    print('main작업1-1 : $data');  // 나중에 제일 먼저 출력 첫번째
  }, onError: (e) {
    // 요청 실패 시 에러메세지 출력
    print(e);
  });
  print("main끝1-1");
  print("===============================");

  print("main시작1-2");
  // 호출과 동시에 then절 사용. 즈위와 동일
  myRequest1(100).then( (data) {
    print('main작업1-2 : $data'); // 나중에 두번째 출력.
  }, onError: (e) {
    print(e);
  });
  print("main끝1-2");
  print("===============================");

  // 내부 클래스에 사용할 변수 생성.
  int nCount = 10;    // 다음은 이너클래스(내부클래스)이므로 이 변수 사용 가능
  // Future객체를 통해 내부클래스로 정의
  Future<int> myRequest2 = new Future(() {
    int rNum = 0;
    for(int i=0 ; i<=nCount ; i++){
      rNum = rNum + i;
    }
    return rNum;
  });

  // Future객체를 통해 즉시 실행
  print("myRequest2 시작3");
  myRequest2.then( (data) {
    // 미래에 결과가 도착하면 출력
    print('myRequest2 작업3 : $data');  // 나중에 세번 째 출력. 마지막에 출력
  }, onError: (e) {
    print(e);
  });
  print("myRequest2 끝3");
  /*
    위에서 호출한 3개의 메서드는 모두 다 시간이 많이 걸리는 작업으로
    main()메서드가 종료되더라도 실행되다가, 결과가 콜백되면 그때 종료된다.
    Java의 Thread(쓰레드)와 유사한 동작방식을 가진다.
  */
}//end of main
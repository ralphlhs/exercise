import 'dart:io';

void main(){
  showData();
  carbrand.forEach((element) {print(element);});
  carbrand.forEach(print);



  Spicy(a: '에이요~');

  print(Spicy().aaa());
  String text; // null safty 적용.
  if (DateTime.now().hour <= 12) {
    text = "지금은 오전입니다.";
  } else {
    text = "지금은 오후입니다.";
  }
  print(text);
  var slot = Slot<Rectangle>();
  slot.insert(Rectangle());
}

List<String> carbrand = ['benz', 'audi', 'Hyungdai', 'bmw'];


void showData(){
  startTask();
  print(accessTask());
  fetchTask(a, b);
  foward(10);
}

void startTask(){
  String info1 = '요청수행 시작';
  print(info1);
}

Future <String> accessTask() async{

  await Future.delayed(const Duration(seconds: 2));
  // sleep(const Duration(seconds: 2));
  String info2 = '데이터에 접속중';
  // print(info2);
  return info2;
}

int a = 2;
int b = 34;

void fetchTask(c, b){
  int total = c + b;
  String info3 = '잔액은 8,500원입니다. 그리고 깨평$total';
  print(info3);
}

void foward(int num){
  for(int i=0;i< num;i+=3) {
    print('$i 번 전진했습니다.');
  }
}

class Circle{
  Circle(){
    print("이건 circle클래스");
  }
  letText(){
    print("이건 circle클래스의 또다른 함수");
  }
}
class Rectangle{
  Rectangle(){
    print("이건 Rectangle클래스");
  }
}
class Slot<_>{
  insert(_ shape){
    // print(shape);
  }
}

class Spicy {
  String? a;
  int b = 10;

  Spicy({String a = ''}) {
    print('이거슨...$a');
  }

  String? aaa() {
    return a;
  }
}
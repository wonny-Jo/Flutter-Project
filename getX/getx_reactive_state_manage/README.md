
## getx_reactive_state_manage(반응형상태관리)

### getX를 이용한 반응형상태관리
단순상태관리와 비교했을때 반응형은 값이 변화하지 않으면 호출되지 않는다. 리소스 관리에 효율적.

#### 상태관리 및 상태표시 페이지작성
```dart
Get.put(CountControllerWithReactive());


Obx(()=>Text(
  "${Get.find<CountControllerWithReactive>().count.value}",
  style: TextStyle(fontSize: 50),
)),
ElevatedButton(
  child: Text('+',style: TextStyle(fontSize: 30),),
  onPressed: (){
    Get.find<CountControllerWithReactive>().increase();
  },
),
ElevatedButton(
  child: Text('5로 변경',style: TextStyle(fontSize: 30),),
  onPressed: (){
    Get.find<CountControllerWithReactive>().putNumber(5);
  },
),
```

#### 컨트롤러페이지작성
```dart
import 'package:get/get.dart';

class CountControllerWithReactive{
  RxInt count=0.obs;
  void increase(){
    count++;
}
void putNumber(int value){
  count(value);
}
```

### GetController를 통해 호출 상태 확인 가능
```dart
class CountControllerWithReactive extends GetxController{
  RxInt count=0.obs;
  void increase(){
    count++;
  }
  void putNumber(int value){
    count(value);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    ever(count,(_)=>print('매번 호출')); //해당 변수가 리액트 상태에서만 가능
    once(count, (_)=> print('한번만 호출')); //한번만 호출됨
    debounce(count,(_)=>print("마지막 변경에 한번만 호출"),time: Duration(seconds: 1)); //마지막 상태만 호출
    interval(count,(_)=>print("변경되고 있는 동안 1초마다 호출"), time: Duration(seconds: 1)); //계속 변경되고 있다면 1초마다 호출 됨
    super.onInit();
  }

  // @override
  // void onClose() {
  //   // TODO: implement onClose
  //   super.onClose();
  // }

// @override
//   // TODO: implement onDelete
//   get onDelete => super.onDelete;
}
```

#### 반응형의 변수 선언 및 값 업데이트 방법
```dart
enum NUM { FIRST, SECOND}

class User{
  String name;
  int age;
  User({this.name,this.age});
}

RxInt count=0.obs;
RxDouble _double = 0.0.obs;
RxString value="".obs;
count++;
count(5);
_double++;
_double(424);


Rx<NUM> nums=NUM.FIRST.obs;
nums(NUM.SECOND);

Rx<User> user= User(name: '개남', age:25).obs;
user(User());
user.update((_user){
  _user.name="개발하는 남자";
});

RxList<String> list = [''].obs;
list.addAll('개남','개발하는 남자');
list.add('개남');
list.addIf(user.value.name=="개발하는 남자","okay");

```

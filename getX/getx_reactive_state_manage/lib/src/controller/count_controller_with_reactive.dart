import 'package:get/get.dart';

// enum NUM { FIRST, SECOND}
//
// class User{
//   String name;
//   int age;
//   User({this.name,this.age});
// }

class CountControllerWithReactive extends GetxController{
  RxInt count=0.obs;
  // RxDouble _double = 0.0.obs;
  // RxString value="".obs;
  // Rx<NUM> nums=NUM.FIRST.obs;
  // Rx<User> user= User(name: '개남', age:25).obs;
  // RxList<String> list = [''].obs;
  void increase(){
    count++;
    // _double++;
    // _double(424);
    //
    // nums(NUM.SECOND);
    //
    // user(User());
    // user.update((_user){
    //   _user.name="개발하는 남자";
    // });
    //
    // list.addAll();
    // list.add();
    // list.addIf(user.value.name=="개발하는 남자","okay");
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
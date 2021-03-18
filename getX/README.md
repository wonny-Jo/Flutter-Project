
# getX 정리
## getx_route_manage

### getX 세팅
1. https://pub.dev/packages/get/install 에서 get 버젼 복사후 pubspec.yaml에 적용
2. pub get 사용
3. main.dart에 MaterialApp을 GetMaterialApp으로 변경
4. import 'package:get/get.dart'; 적용

### getX를 이용한 route 관리(provider와 비교)
getX는 provider와 비교했을 때 간결하다는 장점이 있다. 또한 context에 접근하지 않아도 되므로 build가 아닌 다른 위치에서도 사용이 가능하다.

#### normal route 관리
##### main에서 page접근
```dart
home : Home(),
```
##### page 이동
provider
```dart
Navigator.of(context).push(MaterialPageRoute(
  builder: (_) => FirstPage(),
));
```
getX
```dart
Get.to(FirstPage());
```

##### page 뒤로 이동
provider
```dart
Navigator.of(context).pop();
```
getX
```dart
Get.back();
```

##### page 홈으로 이동
provider
```dart
Navigator.of(context).pushAndRemoveUntil(
     MaterialPageRoute(builder: (_)=>Home()),
     (route)=>false);
```
getX
아래와 같이 사용해도 되나 stack이 남게 된다.
```dart
Get.to(Home());
```
stack을 없애려만 아래와 같이 사용할 것.
```dart
Get.offAll(Home());
```

#### named route 관리
normal과 비교했을 때 더 간결하게 작성 가능하고 transition으로 화면 전환시 사용될 애니메이션을 변경할 수 있다.
##### main에 page 이름 설정
provider
```dart
initialRoute: '/',
routes: {
  '/': (context)=>Home(),
  '/first':(context)=>FirstNamedPage(),
  '/second':(context)=>SecondNamedPage(),
},
```
getX
```dart
getPages:[
  GetPage(
    name:'/',
    page: ()=>Home(),
    transition: Transition.zoom,
  ),
  GetPage(
    name:'/first',
    page: ()=>FirstNamedPage(),
    transition : Transition.zoom,
  ),
  GetPage(
    name:'/second',
    page: ()=>SecondNamedPage(),
    transition : Transition.zoom,
  ),
]
```

##### page 이동
provider
```dart
Navigator.of(context).pushNamed("/first");
```
getX
```dart
Get.toNamed('/first');
```
##### page 뒤로 이동
normal과 동일


##### page 홈으로 이동
provider
```dart
Navigator.of(context).pushNamedAndRemoveUntil(
    '/', (route) => false);
```
getX
```dart
//Get.toNamed('/');
Get.offAllNamed('/');
```

#### argument 전달
##### main의 getPages에 추가
```dart
GetPage(
    name:'/next',
    page: ()=>NextPage(),
    transition : Transition.zoom,
  ),
```

##### toNamed의 argument 속성을 통해 전달
```dart
Get.toNamed('/next', arguments: User(
                  name: "개발하는남자",
                  age: 32,
                ));
//2. Get.toNamed('/next', arguments: {'name':'개남', 'age':'22'});
//1. Get.toNamed('/next'',arguments: '개남');

class User{
  String name;
  int age;
  User({this.name, this.age});
}
```

##### Get의 arguments를 통해 전달받음
```dart
Text("${(Get.arguments as User).name} : ${(Get.arguments as User).age}"),
//2. Text("${Get.arguments['name']} : ${Get.arguments['age']}"),
//1. Text("${Get.arguments.toString()}"),
```

#### parameter 전달
이전에는 아래와 같이 사용 가능했으나 현재 ^3.26.0버젼에서는 불가.

uid만 전달 받는 것은 가능하나 추가 정보가 받아지지 않음.
##### main의 getPages에 추가
```dart
GetPage(
  name:'/user/:uid',
  page: ()=>UserPage(),
  transition : Transition.zoom,
),
```
##### toNamed의 위치 정보로 parameter 전달
```dart
Get.toNamed('/user/28357?name=개남&age=22');
```
##### Get의 parameters로 전달받음
```dart
Text('${Get.parameters['uid']}'),
Text('${Get.parameters['name']}님 안녕하세요'),
Text('${Get.parameters['age']}'),
```

현재 버젼에서 가능한 방법.
##### main의 getPages에 추가
```dart
GetPage(
  name:'/user',
  page: ()=>UserPage(),
  transition : Transition.zoom,
),
```
##### toNamed의 위치 정보로 parameter 전달
```dart
Get.toNamed('/user?28357&name=개남&age=22');
```
##### Get의 parameters로 전달받음
```dart
Text('${Get.parameters['uid']}'),
Text('${Get.parameters['name']}님 안녕하세요'),
Text('${Get.parameters['age']}'),
```




## getx_getbuilder(단순상태관리)

### provider 세팅
1. https://pub.dev/packages/provider/install 에서 provider 버전 복사후 pubspec.yaml에 적용
2. pub get 사용
4. import 'package:provider/provider.dart'; 적용

### getX를 이용한 단순상태관리(provider와 비교)
getX는 provider와 비교했을 때 간결하다는 장점이 있다. 또한 context에 접근하지 않아도 되므로 build가 아닌 다른 위치에서도 사용이 가능하다.

#### provider
##### 상태관리페이지작성
```dart
Expanded(
  child: ChangeNotifierProvider<CountControllerWithProvider>(
    create: (_)=>CountControllerWithProvider(),
    child: WithProvider(),
  ),
),
```

##### 상태표시페이지작성
```dart
Consumer<CountControllerWithProvider>(
  builder: (_, snapshot, child){
    return Text("${snapshot.count}", style: TextStyle(fontSize: 50),);
  },
),
ElevatedButton(
  child: Text('+',style: TextStyle(fontSize: 30),),
  onPressed: (){
    Provider.of<CountControllerWithProvider>(context, listen: false)
        .increase();
  },
)
```

##### 컨트롤러페이지작성
```dart
import 'package:flutter/cupertino.dart';

class CountControllerWithProvider extends ChangeNotifier {
  int count=0;
  void increase(){
    count++;
    notifyListeners();
  }
}
```

#### getX
##### 상태관리페이지작성
```dart
Get.put(CountControllerWithGetx());
Expanded(
  child: WithGetX(),
),
```

##### 상태표시페이지작성
```dart
GetBuilder<CountControllerWithGetx>(
    builder: (controller){
      return Text('${controller.count}', style: TextStyle(fontSize: 50),);
  }
),
ElevatedButton(
  child: Text('+',style: TextStyle(fontSize: 30),),
  onPressed: (){
    Get.find<CountControllerWithGetx>().increase();
  },
)
```

##### 컨트롤러페이지작성
```dart
import 'package:get/get.dart';

class CountControllerWithGetx extends GetxController {
  int count=0;
  void increase(){
    count++;
    update();
  }
}
```

#### getX는 provider와 다르게 id를 지정하여 컨트롤러에 접근이 가능하다
##### 상태표시페이지
```dart
CountControllerWithGetx _controllerWithGetx = Get.put(CountControllerWithGetx());

Widget _button(String id) {
  return ElevatedButton(
    child: Text('+', style: TextStyle(fontSize: 30),),
    onPressed: () {
      //Get.find<CountControllerWithGetx>().increase();
      _controllerWithGetx.increase(id);
    },
  );
}

GetBuilder<CountControllerWithGetx>(
    id: 'first',
    builder: (controller){
      return Text('${controller.count}', style: TextStyle(fontSize: 50),);
  }
),
GetBuilder<CountControllerWithGetx>(
    id:'second',
    builder: (controller){
      return Text('${controller.count}', style: TextStyle(fontSize: 50),);
    }
),
_button('first'),
_button('second'),
```
##### 컨트롤러 페이지
```dart
import 'package:get/get.dart';

class CountControllerWithGetx extends GetxController {
  int count=0;
  void increase(String id){
    count++;
    update([id]);
  }
}
```


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



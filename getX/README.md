
# getX 정리
## getx_tutorial

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

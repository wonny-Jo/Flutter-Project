# getx_tutorial

## getX 세팅
1. https://pub.dev/packages/get/install 에서 get 버젼 복사후 pubspec.yaml에 적용
2. pub get 사용
3. main.dart에 MaterialApp을 GetMaterialApp으로 변경
4. import 'package:get/get.dart'; 적용

## getX를 이용한 route 관리(provider와 비교)
getX는 provider와 비교했을 때 간결하다는 장점이 있다. 또한 context에 접근하지 않아도 되므로 build가 아닌 다른 위치에서도 사용이 가능하다.

### normal route 관리
#### main에서 page접근
```dart
home : Home(),
```
#### page 이동
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

#### page 뒤로 이동
provider
```dart
Navigator.of(context).pop();
```
getX
```dart
Get.back();
```

#### page 홈으로 이동
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

### page 이동(named)
#### main에 page 이름 설정
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
  GetPage(
    name:'/next',
    page: ()=>NextPage(),
    transition : Transition.zoom,
  ),
  GetPage(
    name:'/user',
    page: ()=>UserPage(),
    transition : Transition.zoom,
  ),
]
```

####

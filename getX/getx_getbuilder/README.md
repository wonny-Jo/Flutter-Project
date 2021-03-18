
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

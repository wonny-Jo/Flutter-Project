import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_reactive_state_manage/src/controller/count_controller_with_reactive.dart';
import '../controller/count_controller_with_getx.dart';
import '../controller/count_controller_with_provider.dart';
import 'package:provider/provider.dart';
import 'state/with_getx.dart';
import 'state/with_provider.dart';

class ReactiveStateManagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(CountControllerWithReactive());
    return Scaffold(
      appBar: AppBar(
        title: Text('반응형상태관리'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Getx', style: TextStyle(fontSize: 30),),
            // GetX(builder: (_){
            //   return Text(
            //         "${Get.find<CountControllerWithReactive>().count.value}",
            //         style: TextStyle(fontSize: 50));
            //   },
            // ),
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
          ],
        ),
      ),
    );
  }
}

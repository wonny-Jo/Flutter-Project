import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/count_controller_with_getx.dart';

class BindingPage extends GetView<CountControllerWithGetx> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
         Obx(()=> Text(controller.count.toString(),style: TextStyle(fontSize: 40),)),

          ElevatedButton(
            onPressed: (){
              controller.increase();
            },
          )
        ],
      )
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/dependency_controller.dart';

class GetPut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ElevatedButton(
        onPressed: (){
          //print(Get.find<DependencyController>().hashCode);
          Get.find<DependencyController>().increase();
        },
      ),

    );
  }
}

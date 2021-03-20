import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/getx_service_test.dart';

class GetxServiceWidget extends GetView<GetxServiceTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
                  () => Text(
                controller.count.value.toString(),
                style: TextStyle(fontSize: 50),
              ),
            ),
            ElevatedButton(
              onPressed: (){
                controller.increase();
              },
              child: Text('Getx Service Increase'),
            ),
            ElevatedButton(
              onPressed: (){
                Get.reset();
              },
              child: Text('Getx Service clear'),
            ),
          ],
        ),
      ),
    );
  }
}

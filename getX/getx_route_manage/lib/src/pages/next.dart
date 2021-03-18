import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../home.dart';

class NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Next Page'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${(Get.arguments as User).name} : ${(Get.arguments as User).age}"),
            //2. Text("${Get.arguments['name']} : ${Get.arguments['age']}"),
            //1. Text("${Get.arguments.toString()}"),
            ElevatedButton(
              child: Text("뒤로 이동"),
              onPressed: () {
                //Navigator.of(context).pop();
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecondNamedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Named Page'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text("뒤로 이동"),
              onPressed: () {
                //Navigator.of(context).pop();
                Get.back();
              },
            ),
            ElevatedButton(
              child: Text("홈으로 이동"),
              onPressed: () {
                // Navigator.of(context).pushNamedAndRemoveUntil(
                //     '/', (route) => false);
                //Get.toNamed('/');
                Get.offAllNamed('/');
              },
            )
          ],
        ),
      ),
    );
  }
}
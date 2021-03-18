import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),),
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
                // Navigator.of(context).pushAndRemoveUntil(
                //     MaterialPageRoute(builder: (_)=>Home()),
                //     (route)=>false);
                //Get.to(Home());
                Get.offAll(Home());
              },
            )
          ],
        ),
      ),
    );
  }
}

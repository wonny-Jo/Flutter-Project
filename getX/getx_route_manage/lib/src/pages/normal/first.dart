import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'second.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text("다음페이지 이동"),
              onPressed: () {
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (_) => SecondPage(),
                // ));
                Get.to(SecondPage());
              },
            )
          ],
        ),
      ),
    );
  }
}
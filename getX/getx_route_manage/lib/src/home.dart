import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pages/normal/first.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("라우트 관리 홈")
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text("일반적인 라우트"),
              onPressed: () {
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (_) => FirstPage(),
                // ));
                Get.to(FirstPage());
              },
            ),
            ElevatedButton(
              child: Text("Named 라우트"),
              onPressed: () {
                //Navigator.of(context).pushNamed("/first");
                Get.toNamed('/first');
              },
            ),
            ElevatedButton(
              child: Text("Arguments 전달"),
              onPressed: () {
                Get.toNamed('/next', arguments: User(
                  name: "개발하는남자",
                  age: 32,
                ));
                //2. Get.toNamed('/next', arguments: {'name':'개남', 'age':'22'});
                //1. Get.toNamed('/next'',arguments: '개남');
                //Get.to(NextPage(),arguments: '개남');
              },
            ),
            ElevatedButton(
              child: Text("동적 url 전달"),
              onPressed: () {
                Get.toNamed('/user?uid=28357&name=개남&age=22');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class User{
  String name;
  int age;
  User({this.name, this.age});
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pages/dependencys/dependency_manage_page.dart';
import 'pages/normal/first.dart';
import 'pages/reactive_state_manage_page.dart';
import 'pages/simple_state_manage_page.dart';

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
            ElevatedButton(
              child: Text("단순상태관리"),
              onPressed: () {
                Get.to(SimpleStateManagePage());
              },
            ),
            ElevatedButton(
              child: Text("반응형상태관리"),
              onPressed: () {
                Get.to(ReactiveStateManagePage());
              },
            ),
            ElevatedButton(
              child: Text("의존성 관리"),
              onPressed: () {
                Get.to(DependencyManagePage());
              },
            ),
            ElevatedButton(
              child: Text("바인딩"),
              onPressed: () {
                Get.toNamed('/binding');
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
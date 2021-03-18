import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tutorial/src/pages/named/first.dart';
import 'package:getx_tutorial/src/pages/named/second.dart';
import 'package:getx_tutorial/src/pages/next.dart';
import 'package:getx_tutorial/src/pages/user.dart';
import 'src/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home : Home(),
      
      // initialRoute: '/',
      // routes: {
      //   '/': (context)=>Home(),
      //   '/first':(context)=>FirstNamedPage(),
      //   '/second':(context)=>SecondNamedPage(),
      // },

      getPages:[
        GetPage(
          name:'/',
          page: ()=>Home(),
          transition: Transition.zoom,
        ),
        GetPage(
          name:'/first',
          page: ()=>FirstNamedPage(),
          transition : Transition.zoom,
        ),
        GetPage(
          name:'/second',
          page: ()=>SecondNamedPage(),
          transition : Transition.zoom,
        ),
        GetPage(
          name:'/next',
          page: ()=>NextPage(),
          transition : Transition.zoom,
        ),
        GetPage(
          name:'/user',
          page: ()=>UserPage(),
          transition : Transition.zoom,
        ),
      ]
    );
  }
}

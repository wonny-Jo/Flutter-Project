import 'package:flutter/material.dart';
import 'package:navigator/screenA.dart';
import 'package:navigator/screenB.dart';
import 'package:navigator/screenC.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context)=>ScreenA(),
        '/b': (context)=>ScreenB(),
        '/c':(context)=>ScreenC()
      },
    );
  }
}
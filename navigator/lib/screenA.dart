import 'package:flutter/material.dart';

class ScreenA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ScreenA'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/b');
                },
                child: Text('Go to ScreenB'),
              color: Colors.red,
            ),
            FlatButton(
              onPressed: (){
                Navigator.pushNamed(context, '/c');
              },
              child: Text('Go to ScreenC'),
              color: Colors.red,
            ),
          ],
        ),
      )
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/getx_controller_test.dart';
import 'controller/getx_service_test.dart';
import 'pages/getx_controller_widget.dart';
import 'pages/getx_service_widget.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: (){
                  Get.to(
                    GetxControllerWidget(),
                    binding: BindingsBuilder(
                        ()=>Get.lazyPut<GetxControllerTest>(
                                () => GetxControllerTest()),
                    ),
                  );
                },
                child: Text("Getx Controller"),
            ),
            ElevatedButton(
              onPressed: (){
                Get.to(
                  GetxServiceWidget(),
                  binding: BindingsBuilder(
                        ()=>Get.lazyPut<GetxServiceTest>(
                            () => GetxServiceTest()),
                  ),
                );
              },
              child: Text("Getx Service"),
            ),
          ],
        ),
      ),
    );
  }
}

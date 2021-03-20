import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_dependencys/src/pages/dependencys/get_lazyput.dart';
import '../../controller/dependency_controller.dart';
import 'get_put.dart';

class DependencyManagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("의존성 주입"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('GetPut'),
              onPressed: (){
                Get.to(
                  GetPut(),
                  binding: BindingsBuilder((){
                    Get.put(DependencyController());
                  })
                );
              },
            ),
            ElevatedButton(
              child: Text('Get.lazyPut'),
              onPressed: (){
                Get.to(
                    GetLazyPut(),
                    binding: BindingsBuilder((){
                      Get.lazyPut<DependencyController>(
                              ()=>DependencyController());
                    })
                );
              },
            ),
            ElevatedButton(
              child: Text('Get.putAsync'),
              onPressed: (){
                Get.to(
                    GetPut(),
                    binding: BindingsBuilder((){
                      Get.putAsync<DependencyController>(() async {
                        await Future.delayed(Duration(seconds: 5));
                        return DependencyController();
                      });
                    }),
                );
              },
            ),
            ElevatedButton(
              child: Text('Get.create'),
              onPressed: (){
                Get.to(
                  GetPut(),
                  binding: BindingsBuilder((){
                    Get.create<DependencyController>(
                            ()=> DependencyController());
                  }),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

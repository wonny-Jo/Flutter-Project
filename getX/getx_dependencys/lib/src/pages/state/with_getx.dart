import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/count_controller_with_getx.dart';

class WithGetX extends StatelessWidget {
  CountControllerWithGetx _controllerWithGetx = Get.put(CountControllerWithGetx());

  Widget _button() {
    return ElevatedButton(
      child: Text('+', style: TextStyle(fontSize: 30),),
      onPressed: () {
        //Get.find<CountControllerWithGetx>().increase();
        _controllerWithGetx.increase();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Getx', style: TextStyle(fontSize: 30),),
          GetBuilder<CountControllerWithGetx>(
              builder: (controller){
                return Text('${controller.count}', style: TextStyle(fontSize: 50),);
            }
          ),
          _button(),
          ElevatedButton(
            child: Text('5로 변경',style: TextStyle(fontSize: 30),),
            onPressed: (){
              _controllerWithGetx.putNumber(5);
            },
          )
        ],
      ),
    );
  }
}

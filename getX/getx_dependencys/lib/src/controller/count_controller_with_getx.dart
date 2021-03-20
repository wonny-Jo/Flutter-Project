import 'package:get/get.dart';

class CountControllerWithGetx extends GetxController {
  static CountControllerWithGetx get to => Get.find();
  RxInt count=0.obs;
  void increase(){
    count++;
    update();
  }
  void putNumber(int x)
  {
    count(x);
    update();
  }
}
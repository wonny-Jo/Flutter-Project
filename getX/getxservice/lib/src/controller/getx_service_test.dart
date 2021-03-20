import 'package:get/get.dart';

class GetxServiceTest extends GetxService{
  static GetxServiceTest get to => Get.find();
  RxInt count=0.obs;

  void increase(){
    count++;
  }
}
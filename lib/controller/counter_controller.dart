import 'package:get/get.dart';

class CounterController extends GetxController {
  int counter = 0;

  increament() {
    counter++;
    update();
  }
}

class CounterContollerWithRxDart extends GetxController {
  RxInt counter = 0.obs;

  subToCounter() {
    if (counter < -2) {
      Get.showSnackbar(GetSnackBar(message: 'Hello ',));
    }
    counter--;
  }
}

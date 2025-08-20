import 'package:get/get.dart';

class CounterController extends GetxController {
  var count = 0.obs;
  var multiple = 1.obs; // default multiple is 2

  void increment() {
    count.value += multiple.value;
  }

  void reset() {
    count.value = 0;
  }

  void setMultiple(int value) {
    multiple.value = value;
  }
}


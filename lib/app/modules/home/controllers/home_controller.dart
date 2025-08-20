import 'package:get/get.dart';

class HomeController extends GetxController {
    void logout() {
      Get.offNamed('/mobile-login');
    //  print('Logout pressed');
  }
}

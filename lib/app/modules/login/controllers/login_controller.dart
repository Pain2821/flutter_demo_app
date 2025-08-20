// import 'package:get/get.dart';

// class LoginController extends GetxController {
//   var username = ''.obs;
//   var password = ''.obs;

//   // Dummy login logic
//   void login() {
//     if (username.value == "admin" && password.value == "1234") {
//       Get.offNamed('/home'); // move to home page and clear backstack
//     } else {
//       Get.snackbar("Error", "Invalid credentials");
//     }
//   }
// }

import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // For password visibility
  final isHidden = true.obs;

  void togglePasswordVisibility() {
    isHidden.value = !isHidden.value;
  }

  void login() {
    final email = emailController.text.trim();
    final pwd   = passwordController.text.trim();

    if (email == "admin@gmail.com" && pwd == "1234") {
      Get.offNamed('/home'); // move to home page and clear backstack
    } else {
      Get.snackbar("Error", "Invalid credentials");
    }
  }

  void forgotPassword() {
    // TODO: Implement forgot password logic
  }

  void goToRegister() {
    // TODO: Implement navigation to register screen
  }
}

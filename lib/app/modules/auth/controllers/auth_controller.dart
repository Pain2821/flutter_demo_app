import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AuthController extends GetxController {
  final String otpValue = '1234'; // demo OTP (change in production)
  final TextEditingController phoneController = TextEditingController();
  final phoneNumber = ''.obs; // stores full with +91 or other prefix if needed

  // OTP cooldown (used by send flow optionally)
  final isCooldown = false.obs;
  int countdown = 30;

  // validation: India 10-digit only (if you kept India-only)
  // bool get isValidPhoneNumber {
  //   final text = phoneController.text.trim();
  //   return RegExp(r'^[0-9]{10}$').hasMatch(text);
  // }
  bool get isValidPhoneNumber {
    return RegExp(r'^[0-9]{10}$').hasMatch(phoneNumber.value);
  }

  void sendOtp() {
    if (!isValidPhoneNumber) return;

    // build full number (India example)
    final fullNumber = '+91${phoneController.text.trim()}';
    phoneNumber.value = fullNumber;

    // optionally start cooldown here
    startCooldown();

    // navigate to OTP view and pass phone number as argument
    Get.toNamed('/otp', arguments: phoneNumber.value);
  }

  void startCooldown() {
    isCooldown.value = true;
    countdown = 30;
    Future.doWhile(() async {
      await Future.delayed(const Duration(seconds: 1));
      countdown--;
      if (countdown == 0) {
        isCooldown.value = false;
        return false;
      }
      return true;
    });
  }

  @override
  void onClose() {
    phoneController.dispose();
    super.onClose();
  }
}

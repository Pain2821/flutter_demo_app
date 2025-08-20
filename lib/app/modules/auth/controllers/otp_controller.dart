import 'dart:async';
import 'package:get/get.dart';

class OtpController extends GetxController {
  final enteredOtp = ''.obs;         // holds OTP string as user types
  final phoneNumber = ''.obs;         // filled from Get.arguments

  final isCooldown = true.obs; 
  final countdown = 30.obs;

  final correctOtp = '1234';

  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    // read phone passed via Get.toNamed(..., arguments: phone)
    final arg = Get.arguments;
    if (arg != null && arg is String) {
      phoneNumber.value = arg;
    }
    startTimer(); // start resend cooldown immediately
  }

  void startTimer() {
    isCooldown.value = true;
    countdown.value = 30;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (countdown.value > 0) {
        countdown.value--;
      } else {
        isCooldown.value = false;
        t.cancel();
      }
    });
  }

  void resendOtp() {
    // Here you would call API to resend OTP
    startTimer();
    Get.snackbar('OTP', 'OTP resent to ${phoneNumber.value}');
  }

  void verifyOtp() {
    if (enteredOtp.value.length != 4) {
      Get.snackbar('Error', 'Please enter 4 digit OTP');
      return;
    }
    if (enteredOtp.value == correctOtp) {
      Get.offAllNamed('/home'); // success -> home
    } else {
      Get.snackbar('Error', 'Invalid OTP');
    }
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}

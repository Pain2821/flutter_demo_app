import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../controllers/otp_controller.dart';

class OtpView extends StatelessWidget {
  OtpView({super.key});

  final OtpController controller = Get.find<OtpController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: () => Get.back()),
        title: const Text('Verify OTP'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 12),
            const Text(
              'We just sent an SMS',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Enter the security code we sent to',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 8),
            Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      controller.phoneNumber.value,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(width: 8),
                    GestureDetector(
                      onTap: () => Get.back(), // go back to edit number
                      child: const Icon(Icons.edit, size: 18),
                    ),
                  ],
                )),
            const SizedBox(height: 28),

            // 4-box OTP input
            PinCodeTextField(
              appContext: context,
              length: 4,
              keyboardType: TextInputType.number,
              animationType: AnimationType.fade,
              autoFocus: true,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(8),
                fieldHeight: 60,
                fieldWidth: 60,
                inactiveColor: Colors.grey,
                activeColor: Theme.of(context).colorScheme.primary,
                selectedColor: Theme.of(context).colorScheme.primary,
              ),
              onChanged: (value) => controller.enteredOtp.value = value,
              onCompleted: (value) {
                controller.enteredOtp.value = value;
                // optional: auto-verify when all digits entered
                // controller.verifyOtp();
              },
            ),

            const SizedBox(height: 22),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: controller.verifyOtp,
                child: const Text('Verify', style: TextStyle(fontSize: 16)),
              ),
            ),

            const SizedBox(height: 16),

            Obx(() {
              if (controller.isCooldown.value) {
                return Text(
                  'Resend - 00:${controller.countdown.value.toString().padLeft(2, '0')}',
                  style: const TextStyle(color: Colors.grey),
                );
              }
              return TextButton(
                onPressed: controller.resendOtp,
                child: const Text('Resend Code', style: TextStyle(fontWeight: FontWeight.bold)),
              );
            }),
          ],
        ),
      ),
    );
  }
}

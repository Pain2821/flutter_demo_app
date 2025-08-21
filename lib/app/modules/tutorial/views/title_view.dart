import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/tutorial_controller.dart';

class TitleSection extends StatelessWidget {
  TitleSection({super.key});

  final TutorialController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 👇 These listen to controller values
                Obx(() => Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        controller.name.value,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )),
                Obx(() => Text(
                      controller.location.value,
                      style: TextStyle(color: Colors.grey[500]),
                    )),
              ],
            ),
          ),
          Icon(Icons.star, color: Colors.red[500]),
          const Text('41'),
        ],
      ),
    );
  }
}

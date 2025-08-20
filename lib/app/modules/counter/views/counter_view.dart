import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/counter_controller.dart';

class CounterView extends StatelessWidget {
  CounterView({super.key});

  final CounterController controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Counter"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Title
            Obx(
              () => Text(
                "Multiple of ${controller.multiple.value}",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            const SizedBox(height: 20),

            // Current Counter Value (animated)
            Obx(
              () => AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: Text(
                  "${controller.count.value}",
                  key: ValueKey<int>(controller.count.value),
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),

            // Multiple selector (rounded buttons)
            SizedBox(
              height: 48,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (_, index) {
                  final val = index + 1;

                  return Obx(() {
                    final selected = controller.multiple.value == val;

                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        elevation: selected ? 1 : 6,
                      ),
                      onPressed: () => controller.setMultiple(val),
                      child: Text("$val"),
                    );
                  });
                },
              ),
            ),
          ],
        ),
      ),

      // FABs
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: 'reset',
            tooltip: "Reset Counter",
            onPressed: controller.reset,
            child: const Text("Clear"),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: 'increment',
            tooltip: "Increment",
            onPressed: controller.increment,
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}

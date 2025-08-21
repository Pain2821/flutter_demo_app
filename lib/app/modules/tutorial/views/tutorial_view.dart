import 'package:flutter/material.dart';
import 'package:flutter_demo_app/app/modules/tutorial/views/buttons_view.dart';
import 'package:flutter_demo_app/app/modules/tutorial/views/title_view.dart';
import 'package:get/get.dart';
import '../controllers/tutorial_controller.dart';

class TutorialView extends GetView<TutorialController> {
  const TutorialView({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Flutter layout demo';
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle),
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TitleSection(),
            ButtonSection(),
          ],
        ),
      ),
    );
  }
}

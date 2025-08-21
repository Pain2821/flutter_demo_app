import 'package:get/get.dart';

class TutorialController extends GetxController {
  var name = "Oeschinen Lake Campground".obs;
  var location = "Kandersteg, Switzerland".obs;

  // You can add methods to update name/location dynamically
  void updateTutorial(String newName, String newLocation) {
    name.value = newName;
    location.value = newLocation;
  }
}

import 'package:get/get.dart';
import '../../../data/db_helper.dart';

class CrudController extends GetxController {
  var names = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchNames();
  }

  void fetchNames() async {
    var data = await DBHelper.getNames();
    names.assignAll(data);
  }

  void addName(String name) async {
    await DBHelper.insertName(name);
    fetchNames();
  }

  void editName(int id, String newName) async {
    await DBHelper.updateName(id, newName);
    fetchNames();
  }

  void deleteName(int id) async {
    await DBHelper.deleteName(id);
    fetchNames();
  }
}

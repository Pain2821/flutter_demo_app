import 'package:get/get.dart';
import '../controllers/tictactoe_controller.dart';

class TicTacToeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TicTacToeController>(() => TicTacToeController());
  }
}

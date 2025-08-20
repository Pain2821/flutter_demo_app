import 'package:get/get.dart';

class TicTacToeController extends GetxController {
  // 3x3 board initialized with empty strings
  var board = List.filled(9, "").obs;

  var currentPlayer = "X".obs;
  var winner = "".obs;

  void makeMove(int index) {
    if (board[index].isEmpty && winner.value.isEmpty) {
      board[index] = currentPlayer.value;

      if (_checkWinner(currentPlayer.value)) {
        winner.value = "${currentPlayer.value} wins!";
      } else if (!board.contains("")) {
        winner.value = "It's a Draw!";
      } else {
        // switch turns
        currentPlayer.value = currentPlayer.value == "X" ? "O" : "X";
      }
    }
  }

  bool _checkWinner(String player) {
    List<List<int>> winPatterns = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (var pattern in winPatterns) {
      if (board[pattern[0]] == player &&
          board[pattern[1]] == player &&
          board[pattern[2]] == player) {
        return true;
      }
    }
    return false;
  }

  void resetGame() {
    board.value = List.filled(9, "");
    currentPlayer.value = "X";
    winner.value = "";
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/tictactoe_controller.dart';

class TicTacToeView extends GetView<TicTacToeController> {
  const TicTacToeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text(
          "Tic Tac Toe",
          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 177, 246),
      ),
      body: Padding(
        // Remove 'padding:' here, as Padding widget expects 'padding' as a positional argument
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Game Board
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: 9,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () => controller.makeMove(index),
                    child: Obx(
                      () => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.deepPurple.shade50,
                        ),
                        child: Center(
                          child: Text(
                            controller.board[index],
                            style: TextStyle(
                              fontSize: 42,
                              fontWeight: FontWeight.bold,
                              color: controller.board[index] == "X"
                                  ? Colors.deepPurple
                                  : Colors.pink,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Status / Winner
              Obx(
                () => Text(
                  controller.winner.value.isEmpty
                      ? "Current Player: ${controller.currentPlayer.value}"
                      : "Winner: ${controller.winner.value}",
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // Reset button
              ElevatedButton.icon(
                onPressed: controller.resetGame,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: const Icon(Icons.refresh),
                label: const Text("Reset Game", style: TextStyle(fontSize: 18)),
              ),
              const SizedBox(height: 40), // <-- extra spacing from bottom
            ],
          ),
        ),
      ),
    );
  }
}

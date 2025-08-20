import 'package:flutter/material.dart';

class UpcomingView extends StatelessWidget  {
  const UpcomingView({super.key});

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upcoming Page"),
        automaticallyImplyLeading: true, // 👈 shows back button if possible
      ),
      body: Center(
        child: Text(
          "🚧 Page Under Construction 🚧",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.orange,
          ),
        ),
      ),
    );
  }
}

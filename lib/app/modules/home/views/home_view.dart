import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Grid menu
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _HomeMenuTile(
                    icon: Icons.calculate,
                    label: "Counter",
                    onTap: () => Get.toNamed('/counter'),
                  ),
                  _HomeMenuTile(
                    icon: Icons.list_alt,
                    label: "CRUD",
                    onTap: () => Get.toNamed('/crud'),
                  ),
                  _HomeMenuTile(
                    icon: Icons.security,
                    label: "Permissions",
                    onTap: () => Get.toNamed('/permissions'),
                  ),
                   _HomeMenuTile(
                    icon: Icons.games,
                    label: "Tic Tac Toe",
                    onTap: () => Get.toNamed('/tictactoe'),
                  ),
                  _HomeMenuTile(
                    icon: Icons.tsunami,
                    label: "Tutorial",
                    onTap: () => Get.toNamed('/tutorial'),
                  ),
                  _HomeMenuTile(
                    icon: Icons.upcoming,
                    label: "Upcoming",
                    onTap: () => Get.toNamed('/upcoming'),
                  ),
                ],
              ),
            ),

            // Logout button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.logout),
                label: const Text("Logout"),
                onPressed: controller.logout,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HomeMenuTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _HomeMenuTile({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              blurRadius: 6,
              offset: const Offset(0, 4),
              color: Colors.black.withOpacity(0.1),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 42),
            const SizedBox(height: 10),
            Text(label, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

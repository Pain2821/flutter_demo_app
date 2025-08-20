import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/permissions_controller.dart';

class PermissionsView extends StatelessWidget {
  PermissionsView({super.key});

  final PermissionsController controller = Get.put(PermissionsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Permissions"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  GestureDetector(
                    onTap: controller.requestCamera,
                    child: const _PermissionIcon(
                      icon: Icons.camera_alt,
                      label: "Camera",
                    ),
                  ),
                  GestureDetector(
                    onTap: controller.requestGallery,
                    child: const _PermissionIcon(
                      icon: Icons.photo,
                      label: "Gallery",
                    ),
                  ),
                  GestureDetector(
                    onTap: controller.requestContacts,
                    child: const _PermissionIcon(
                      icon: Icons.contact_page,
                      label: "Contacts",
                    ),
                  ),
                  GestureDetector(
                    onTap: controller.requestLocation,
                    child: const _PermissionIcon(
                      icon: Icons.location_on,
                      label: "Location",
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: controller.requestAllPermissions,
                child: const Text("Request All Permissions"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PermissionIcon extends StatelessWidget {
  final IconData icon;
  final String label;

  const _PermissionIcon({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 48),
        const SizedBox(height: 8),
        Text(label),
      ],
    );
  }
}

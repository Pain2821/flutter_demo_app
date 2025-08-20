import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_picker/image_picker.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:geolocator/geolocator.dart';

class PermissionsController extends GetxController {

  Future<void> requestAllPermissions() async {
    await [
      Permission.camera,
      Permission.photos,      // for gallery
      Permission.contacts,
      Permission.location,
    ].request();
  }
    final picker = ImagePicker();

  Future<void> requestCamera() async {
    if (await Permission.camera.request().isGranted) {
      final pickedFile = await picker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        print("📸 Captured image: ${pickedFile.path}");
      }
    }
  }

  Future<void> requestGallery() async {
    if (await Permission.photos.request().isGranted ||
        await Permission.storage.request().isGranted) {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        print("🖼️ Selected image: ${pickedFile.path}");
      }
    }
  }

  Future<void> requestContacts() async {
    if (await Permission.contacts.request().isGranted) {
      final contacts = await ContactsService.getContacts(withThumbnails: false);
      print("👥 First contact: ${contacts.isNotEmpty ? contacts.first.displayName : 'No contacts'}");
    }
  }

  Future<void> requestLocation() async {
    if (await Permission.location.request().isGranted) {
      Position pos = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      print("📍 Location: ${pos.latitude}, ${pos.longitude}");
    }
  }
}


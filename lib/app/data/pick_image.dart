import 'package:image_picker/image_picker.dart';

class PickImage{

  static Future<XFile?>pickImageCamera() async {
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.camera);
    return image;
  }

  static Future<XFile?>pickImageGallery() async {
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    return image;
  }

}
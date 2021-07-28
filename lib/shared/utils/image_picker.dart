import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImgPicker {
  static Future<File?> pick({
    bool isGallery = true,
    Future<File> Function(File file)? cropImage,
  }) async {
    final source = isGallery ? ImageSource.gallery : ImageSource.camera;
    final pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile == null) return null;
    if (cropImage == null) return File(pickedFile.path);
    final file = File(pickedFile.path);
    return cropImage(file);
  }
}

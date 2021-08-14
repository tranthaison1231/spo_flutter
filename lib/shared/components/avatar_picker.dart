import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:spo/shared/components/circle.dart';
import 'package:spo/shared/utils/theme.dart';

class AvatarPicker extends StatelessWidget {
  final File image;
  final ValueChanged<ImageSource> onClicked;

  const AvatarPicker({
    Key? key,
    required this.image,
    required this.onClicked,
  }) : super(key: key);

  Future<ImageSource?> showImageSource(BuildContext context) async {
    if (Platform.isIOS) {
      return showCupertinoModalPopup(
          context: context,
          builder: (context) => CupertinoActionSheet(
                actions: [
                  CupertinoActionSheetAction(
                      onPressed: () =>
                          Navigator.of(context).pop(ImageSource.camera),
                      child: Text('Camera')),
                  CupertinoActionSheetAction(
                      onPressed: () =>
                          Navigator.of(context).pop(ImageSource.gallery),
                      child: Text('Gallery'))
                ],
              ));
    } else {
      return showModalBottomSheet(
          context: context,
          builder: (context) => CupertinoActionSheet(
                actions: [
                  ListTile(
                      onTap: () =>
                          Navigator.of(context).pop(ImageSource.camera),
                      title: Text('Camera'),
                      leading: Icon(Icons.camera_alt)),
                  ListTile(
                      onTap: () =>
                          Navigator.of(context).pop(ImageSource.gallery),
                      title: Text('Gallery'),
                      leading: Icon(Icons.image))
                ],
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final imagePath = this.image.path;
    final image = imagePath.contains('https://')
        ? NetworkImage(imagePath)
        : FileImage(File(imagePath));
    return Center(
      child: Stack(
        children: [
          ClipOval(
            child: Material(
              color: Colors.transparent,
              child: Ink.image(
                image: image as ImageProvider,
                fit: BoxFit.cover,
                width: 160,
                height: 160,
                child: InkWell(
                  onTap: () async {
                    final source = await showImageSource(context);
                    if (source == null) return;
                    onClicked(source);
                  },
                ),
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              right: 4,
              child: buildCircle(
                  all: 3,
                  color: Colors.white,
                  child: buildCircle(
                      child: Icon(Icons.edit, color: Colors.white, size: 20),
                      all: 8,
                      color: Palette.primary)))
        ],
      ),
    );
  }
}

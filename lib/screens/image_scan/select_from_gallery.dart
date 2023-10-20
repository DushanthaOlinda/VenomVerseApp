import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SelectImageFromGallery extends StatelessWidget {
  const SelectImageFromGallery({super.key});

  @override
  Widget build(BuildContext context) {
    var imageFile = _getFromGallery();

    return Scaffold(
        appBar: AppBar(title: const Text('Select Pictures')),
        body: Builder(builder: (context) {
          if (imageFile == null) {
            return const Text('Select Images');
          }
          return Image.file(imageFile!);
        }));
  }
}

_getFromGallery() async {
  final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
  return pickedFile?.path;
}

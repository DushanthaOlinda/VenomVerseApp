import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddNewArticlePage extends StatefulWidget {
  const AddNewArticlePage({Key? key}) : super(key: key);

  @override
  State<AddNewArticlePage> createState() => _AddNewArticlePageState();
}

class _AddNewArticlePageState extends State<AddNewArticlePage> {
  List<File> imageFiles = [];
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Article"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () async {
                var pickedImages = await _getFromGallery();
                if (pickedImages != null) {
                  setState(() {
                    imageFiles.addAll(pickedImages);
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              icon: const Icon(Icons.image),
              label: const Text('Select Images'),
            ),
            const SizedBox(height: 10),
            // Display selected images
            Container(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: imageFiles.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.file(
                      imageFiles[index],
                      width: 150,
                      height: 150,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            // Title Input
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Description Input
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  hintText: 'Enter description...',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
            ),
            const SizedBox(height: 20),
            // Submit Button
            ElevatedButton.icon(
              onPressed: () {
                final title = titleController.text;
                final description = descriptionController.text;
                // You now have the 'title', 'description', and 'imageFiles' collected from the user.
                // You can proceed to process and submit this data as needed.
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              icon: const Icon(Icons.post_add),
              label: const Text(
                'Request',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<List<File>?> _getFromGallery() async {
    final picker = ImagePicker();
    final pickedImages = await picker.pickMultiImage(
      imageQuality: 50, // Adjust image quality as needed
    );

    if (pickedImages != null) {
      return pickedImages.map((pickedImage) => File(pickedImage.path)).toList();
    }

    return null;
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }
}

import 'dart:io';
import 'package:VenomVerse/screens/home_screen.dart';
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
  TextEditingController summaryController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController authorNameController = TextEditingController();
  String selectedCategory = ''; // Store the selected category

  final List<String> categories = [
    "CategoryA",
    "CategoryB",
    "CategoryC"
  ]; // List of categories

  late String dropdownValue;


  @override
  Widget build(BuildContext context) {
    print(categories);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Article"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50.0), // Adjust the top padding as needed
                child: ElevatedButton.icon(
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
              ),
              const SizedBox(height: 10),
              // Display selected images
              SizedBox(
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
              // Summary Input
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: summaryController,
                  decoration: const InputDecoration(
                    labelText: 'Summary',
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
              // Author Name Input
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: authorNameController,
                  decoration: const InputDecoration(
                    labelText: 'Author Name',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Category Dropdown
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child:
                DropdownMenu<String>(
                  initialSelection: categories.first,
                  onSelected: (String? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      dropdownValue = value!;
                    });
                  },
                  dropdownMenuEntries:
                    categories.map<DropdownMenuEntry<String>>((String value) {
                    return DropdownMenuEntry<String>(value: value, label: value);
                  }).toList(),
                ),
                // DropdownMenu<String>(
                //   value: selectedCategory,
                //   onChanged: (String? newValue) {
                //     setState(() {
                //       selectedCategory = newValue!;
                //     });
                //   },
                //   dropdownMenuEntries:
                //       categories.map<Drop
                //     downMenuItem<String>>((String value) {
                //         return DropdownMenuItem<String>(
                //           value: value,
                //           child: Text(value),
                //         );
                //       }).toList(),
                // ),
              ),
              const SizedBox(height: 20),
              // Submit Button
              ElevatedButton.icon(
                onPressed: () {
                  final title = titleController.text;
                  final summary = summaryController.text;
                  final description = descriptionController.text;
                  final authorName = authorNameController.text;

                    _showSuccessDialog(context);

                  // You now have the 'title', 'summary', 'description', 'authorName', 'imageFiles', and 'selectedCategory' collected from the user.
                  // You can proceed to process and submit this data as needed.
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
    } else {
      return null; // Return null explicitly if no images were picked
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    summaryController.dispose();
    descriptionController.dispose();
    authorNameController.dispose();
    super.dispose();
  }
}
void _showSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Successfully Added"),
        content: const Text("Article has been successfully Added."),
        actions: [
          TextButton(
            child: Text("OK"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const MyHomePage(title: 'Venomverse')),
              );// Navigate to the new page
            },
          ),
        ],
      );
    },
  );
}
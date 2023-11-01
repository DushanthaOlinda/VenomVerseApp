import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

class AddNewEbookPage extends StatefulWidget {
  const AddNewEbookPage({Key? key}) : super(key: key);

  @override
  State<AddNewEbookPage> createState() => _AddNewEbookPageState();
}

class _AddNewEbookPageState extends State<AddNewEbookPage> {
  File? selectedPdf;
  // Define variables to store user input
  String category = '';
  String description = '';
  String author = '';
  DateTime? publishedDate;

  // Function to handle PDF file pick
  Future<void> _pickPDF() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      File file = File(result.files.single.path!);
      setState(() {
        selectedPdf = file;
      });
    } else {
      // User canceled the picker
    }
  }

  // Function to handle request
  void _request() {
    // TODO: Handle request
    print('Request button clicked');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Ebook'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[

              // Button to pick PDF
              ElevatedButton(
                onPressed: _pickPDF,
                child: const Text('Pick PDF'),
              ),

              // Text field for Description
              TextField(
                decoration: const InputDecoration(labelText: 'Description'),
                onChanged: (value) {
                  setState(() {
                    description = value;
                  });
                },
              ),

              // Text field for Author
              TextField(
                decoration: const InputDecoration(labelText: 'Author'),
                onChanged: (value) {
                  setState(() {
                    author = value;
                  });
                },
              ),

              // Date picker for Published Date
              ListTile(
                title: const Text(
                  'Published Date',
                  style: TextStyle(fontSize: 16),
                ),
                trailing: publishedDate != null
                    ? Text(
                        '${publishedDate!.day}/${publishedDate!.month}/${publishedDate!.year}',
                        style: const TextStyle(fontSize: 16),
                      )
                    : const Text(
                        'Select Date',
                        style: TextStyle(fontSize: 16),
                      ),
                onTap: () async {
                  final selectedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime.now(),
                  );
                  if (selectedDate != null) {
                    setState(() {
                      publishedDate = selectedDate;
                    });
                  }
                },
              ),

              // Button to request
              ElevatedButton(
                onPressed: _request,
                child: const Text('Request'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

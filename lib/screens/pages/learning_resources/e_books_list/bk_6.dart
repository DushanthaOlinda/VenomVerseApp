import 'package:flutter/material.dart';
import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';

void main() => runApp(const Book6());

class Book6 extends StatelessWidget {
  const Book6({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: EBook6(),
    );
  }
}

class EBook6 extends StatefulWidget {
  const EBook6({super.key});

  @override
  State<EBook6> createState() => _EBook6State();
}

class _EBook6State extends State<EBook6> {
  bool _isLoading = true;
  late PDFDocument document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    document = await PDFDocument.fromAsset('assets/images/e_book.pdf');
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDFViewer'),
      ),
      body: Center(
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : PDFViewer(
                document: document,
                lazyLoad: false,
                zoomSteps: 1,
                showPicker: false, // Set showPicker to false to hide the page picker icon
              ),
      ),
    );
  }
}

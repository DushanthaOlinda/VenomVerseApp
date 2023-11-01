import 'package:flutter/material.dart';
import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';

void main() => runApp(const Book1());

class Book1 extends StatelessWidget {
  const Book1({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: EBook1(),
    );
  }
}

class EBook1 extends StatefulWidget {
  const EBook1({super.key});

  @override
  State<EBook1> createState() => _EBook1State();
}

class _EBook1State extends State<EBook1> {
  bool _isLoading = true;
  late PDFDocument document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    document = await PDFDocument.fromAsset('assets/images/ebook1.pdf');
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

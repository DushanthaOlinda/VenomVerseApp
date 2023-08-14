import 'package:flutter/material.dart';
import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';

void main() => runApp(const Book2());

class Book2 extends StatelessWidget {
  const Book2({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: EBook2(),
    );
  }
}

class EBook2 extends StatefulWidget {
  const EBook2({super.key});

  @override
  State<EBook2> createState() => _EBook2State();
}

class _EBook2State extends State<EBook2> {
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

import 'package:flutter/material.dart';
import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';

void main() => runApp(const Book5());

class Book5 extends StatelessWidget {
  const Book5({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: EBook5(),
    );
  }
}

class EBook5 extends StatefulWidget {
  const EBook5({super.key});

  @override
  State<EBook5> createState() => _EBook5State();
}

class _EBook5State extends State<EBook5> {
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

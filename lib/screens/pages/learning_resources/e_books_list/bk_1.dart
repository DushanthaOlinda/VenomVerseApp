import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class EBook1 extends StatefulWidget {
  const EBook1({Key? key}) : super(key: key);

  @override
  State<EBook1> createState() => _EBook1State();
}

class _EBook1State extends State<EBook1> {
  final String pdfPath = 'assets/images/e_book.pdf';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("E-Books"),
      ),
      body: Center(
        child: PDFView(
          filePath: pdfPath,
          onRender: (pages) {
            setState(() {});
          },
          
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';

class ResultPopup extends StatefulWidget {
  const ResultPopup({Key? key}) : super(key: key);

   @override
  State<ResultPopup> createState() => _ResultPopupState();
}

class _ResultPopupState extends State<ResultPopup> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Snake Detected!'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/snake_image.png',
            width: 100,
            height: 200,
          ),
          const SizedBox(height: 100),
          // const Text(
          //   'Predicted Answer: Seems to be a rattle snake',
          //   style: TextStyle(fontWeight: FontWeight.bold),
          // ),
          const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Predicted Answer:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 40), // Add a 10-pixel vertical space
                Text(
                  'Seems to be a COBRA!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 100),
          const Text(
            'Confidence: 70%',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
    style: ElevatedButton.styleFrom(
    backgroundColor: Colors.red,
    ),
          child: const Text('Close'),
        ),
        ElevatedButton(
          onPressed: () {
            // Add your logic to contact a snake catcher here
          },
          child: const Text('Contact Snake Catcher'),
        ),
      ],
    );
  }
}
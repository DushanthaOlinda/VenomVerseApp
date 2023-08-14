import 'dart:ffi';

import 'package:VenomVerse/screens/pages/catcher/catcher_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'catcher_request.dart';

class ResultPopup extends StatefulWidget {
  const ResultPopup({Key? key, required this.species, required this.confidence})
      : super(key: key);

  final String species;
  final double confidence;
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
          Image.asset(
            'assets/images/snake_image.png',
            width: 100,
            height: 200,
          ),
          const SizedBox(height: 100),
          // const Text(
          //   'Predicted Answer: Seems to be a rattle snake',
          //   style: TextStyle(fontWeight: FontWeight.bold),
          // ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Predicted Answer:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 40), // Add a 10-pixel vertical space
                Text(
                  'Seems to be a ${widget.species}!',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 100),
          Text(
            'Confidence: ${widget.confidence}%',
            style: const TextStyle(fontWeight: FontWeight.bold),
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
            if (context.mounted) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const PendingCatcherRequest(),
                ),
              );
            }
          },
          child: const Text('Contact Snake Catcher'),
        ),
      ],
    );
  }
}

class PendingCatcherRequest extends StatefulWidget {
  const PendingCatcherRequest({super.key});

  @override
  State<PendingCatcherRequest> createState() => _PendingCatcherRequestState();
}

class _PendingCatcherRequestState extends State<PendingCatcherRequest> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadCatcherList(context);
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Catcher Request Sent'),
        ),
        body: Column(
          children: [
            const SizedBox(height: 100),
            LoadingAnimationWidget.discreteCircle(
              size: 100,
              color: Colors.black,
            ),
            const Padding(
              padding: EdgeInsets.all(80.0),
              child: Center(
                  child: Text(
                'Pending Catcher Request Wait until someone accepts the request',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
            ),
          ],
        ));
  }
}

void loadCatcherList(BuildContext context) {
  // BuildContext context;
  Future.delayed(
      const Duration(seconds: 3),
      () => {
            //   Navigator.push(context: context)
            if (context.mounted)
              {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const CatcherList(),
                  ),
                )
              }
          });
}

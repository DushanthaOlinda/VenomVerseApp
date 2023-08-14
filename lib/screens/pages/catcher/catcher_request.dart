import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class CatcherRequest extends StatefulWidget {
  const CatcherRequest({required Key key}) : super(key: key);

  @override
  CatcherRequestState createState() => CatcherRequestState();
}

class CatcherRequestState extends State<CatcherRequest> {
  final RoundedLoadingButtonController _btnController2 =
      RoundedLoadingButtonController();

  void _doSomething() async {
    Timer(const Duration(seconds: 10), () {
      _btnController2.success();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Requests:'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RoundedLoadingButton(
              color: Colors.amber,
              successColor: Colors.amber,
              controller: _btnController2,
              onPressed: _doSomething,
              valueColor: Colors.black,
              borderRadius: 10,
              child: const Text(
                'Request to Be a Catcher',
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            RoundedLoadingButton(
              color: Colors.amber,
              successColor: Colors.amber,
              controller: RoundedLoadingButtonController(),
              onPressed: () {
                // Add your button onPressed logic
              },
              valueColor: Colors.black,
              borderRadius: 10,
              child: const Text(
                'Remove a Snake',
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

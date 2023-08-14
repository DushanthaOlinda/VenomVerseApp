import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'requests_list.dart';

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
            Container(
              width: 300,
              height: 50,
              // padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: RoundedLoadingButton(
                controller: _btnController2,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RequestsList()),
                  );
                },
                borderRadius: 50,
                successColor: Colors.amber,
                valueColor: Colors.black,
                color: Colors.transparent, // Remove the blue color
                child: const Text(
                  'Request to Be a Catcher',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              width: 300,
              height: 50,
              // padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: RoundedLoadingButton(
                controller: RoundedLoadingButtonController(),
                onPressed: () {
                  // Add your button onPressed logic
                },
                borderRadius: 50,
                successColor: Colors.amber,
                valueColor: Colors.black,
                color: Colors.transparent,
                child: const Text(
                  'Remove a Snake',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
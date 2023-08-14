import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:horizontal_card_pager/horizontal_card_pager.dart';
import 'package:horizontal_card_pager/card_item.dart';
import 'catcher/catcher_request.dart';
import 'catcher/requestform_details.dart';
import 'catcher/requests_list.dart';
import 'catcher/result_popup.dart';

// class LearnPage extends StatefulWidget {
//   const LearnPage({Key? key}) : super(key: key);
//
//   @override
//   State<LearnPage> createState() => _LearnPageState();
// }
class LearnPage extends StatefulWidget {
  const LearnPage({Key? key}) : super(key: key);

  @override
  State<LearnPage> createState() => _LearnPageState();
}
class _LearnPageState extends State<LearnPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red[50],
        body: Column(
          children: [
            Container(
              color: Colors.white,
              height: 450,
              width: 400,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CatcherRequest(key: UniqueKey())),

                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onAlertButtonsPressed(BuildContext context) {
    Alert(
      context: context,
      type: AlertType.info,
      title: "You are getting a call",
      desc: "The user is in need of your help. Please answer this call",
      buttons: [
        DialogButton(
          onPressed: () => Navigator.pop(context),
          color: const Color.fromRGBO(0, 179, 134, 1.0),
          child: const Text(
            "Accept",
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontFamily: 'Poppins'),
          ),
        ),
        DialogButton(
          onPressed: () => Navigator.pop(context),
          gradient: const LinearGradient(colors: [
            Color.fromRGBO(255, 80, 80, 1.0),
            Color.fromRGBO(200, 60, 60, 1.0),
            Color.fromRGBO(153, 40, 40, 1.0),
          ], stops: [
            0.0,
            0.5,
            1.0,
          ]),
          child: const Text(
            "Reject",
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontFamily: 'Poppins'),
          ),
        )
      ],
    ).show();
  }
}

// BackgroundService.dart
import 'package:VenomVerse/services/catcher_services_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../main.dart';
import '../models/auth.dart';
import '../screens/pages/catcher/service_cancellation.dart';
import '../screens/pages/catcher/service_requestlist.dart';

class CatcherServices {
  static dynamic handleNewOrder(List<dynamic>? args) {
    Future.delayed(const Duration(seconds: 5), () => {_popAlert(args)});
    // final newOrder = Order.fromJson(args.first as Map<String, dynamic>);
    // Code to show a notification...
  }

  static handleOrderAccepted(List? arguments) {}

  static handleMyOrderAccepted(List? arguments) {}
}

void _onAlertButtonsPressed(BuildContext context) {
  Alert(
    context: context,
    type: AlertType.info,
    title: "You are getting a call",
    desc: "aca",
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

_popAlert(List<dynamic>? args) {
  final context = navigatorKey.currentContext!;
  AuthModel auth = context.read()<AuthModel>();
  Alert(
    context: context,
    type: AlertType.info,
    title: "You are getting a call",
    desc: "${args?[0] ?? 'Snake'} in ${args?[1] ?? 'NearBy'}",
    buttons: [
      DialogButton(
        onPressed: () async => {
          await CatcherServicesApi.serviceRequestResponse(
              args?[3] ?? 0, int.parse(auth.userName ?? "0"), true),
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const ServiceRequests()),
          )
        },
        color: const Color.fromRGBO(0, 179, 134, 1.0),
        child: const Text(
          "Accept",
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontFamily: 'Poppins'),
        ),
      ),
      DialogButton(
        // CancelReasonDialog();
        onPressed: () async => {
          await CatcherServicesApi.serviceRequestResponse(
              args?[3] ?? 0, int.parse(auth.userName ?? "0"), false),
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const CancelReasonDialog()),
          )
        },
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

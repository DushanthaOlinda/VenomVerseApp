import 'package:VenomVerse/screens/pages/catcher/service_info.dart';
import 'package:VenomVerse/services/catcher_services_api.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:stacked_notification_cards/stacked_notification_cards.dart';
import 'package:flutter/material.dart';

import '../../../models/auth.dart';

class ServiceRequests extends StatefulWidget {
  const ServiceRequests({super.key});

  @override
  State<ServiceRequests> createState() => _ServiceRequestsState();
}

class _ServiceRequestsState extends State<ServiceRequests> {



  // final Map<String, dynamic> _notificationData = await CatcherServicesApi.getPendingServices(userName);

      final _testtt = {
    "requestServiceId": 0,
    "reqUserId": 0,
    "catcherId": 0,
    "dateTime": "2023-10-31T03:25:44.214Z",
    "scannedImageLink": "string",
    "scannedImageId": 0,
    "selectedSerpent": 0,
    "rate": 0,
    "ratingComment": "string",
    "catcherMedia": [
      "string"
    ],
    "catcherFeedback": "string",
    "serviceFeedback": "string",
    "serviceFeedbackMedia": [
      "string"
    ],
    "reqUserFirstName": "string",
    "reqUserLastName": "string",
    "catcherFirstName": "string",
    "catcherLastName": "string",
    "scanImgUrl": "string"
  };

  final List<Map<String, dynamic>> _notificationData1 = [
    {
      'title': 'සිරිපාල පෙරේරා',
      'subtitle': 'සිරිපාල පෙරේරා ඔබගේ සේවය ඉල්ලා ඇත',
    },
    {
      'title': 'John Alvis',
      'subtitle': 'John Alvis has requested your service',
    },
    {
      'title': 'Sayuru Madimbada',
      'subtitle': 'Sayuru Madimbada has requested your service',
    },
    {
      'title': 'Buwaneka Rajapakse',
      'subtitle': 'Buwaneka Rajapakse has requested your service',
    },
    {
      'title': 'Anton Piyadasa',
      'subtitle': 'Anton Piyadasa has requested your service',
    },
  ];

  List<NotificationCard> _generateNotificationCards(List<dynamic> notificationData) {


    final List<NotificationCard> notificationCards = [];

    for (var data in notificationData) {
      var snake = 'Cobra';
      switch (data['selectedSerpent']) {
        case 0 : // Enter this block if mark == 0
          snake = "Rat snake" ;
          break;
        case 1 : //
          snake = "Cobra";
          break;
        case 2:
          snake = "Indian Python" ;
          break;
        case 3:
          snake = "Sand Boa" ;
          break;
        case 4:
          snake = "Hump Nosed Viper";
          break;
        case 6:
          snake = "Sri Lankan Krait";
          break;
        case 7:
          snake = "Common Krait";
          break;
        case 8:
          snake = "Russell’s Viper";
          break;
        case 9:
          snake = "Saw-scaled Viper";
          break;
      default :
          snake = "Not Detected";
      }

      notificationCards.add(NotificationCard(
        date: DateTime.now().subtract(
          Duration(minutes: notificationCards.length * 4),
        ),
        leading: const Icon(
          Icons.account_circle,
          size: 48,
        ),
        title: data['reqUserFirstName'] + " requested for " + snake as String,
        subtitle: data['requestServiceId'].toString(),
      ));
    }

    return notificationCards;
  }

  @override
  Widget build(BuildContext context) {
    var auth = context.watch<AuthModel>();
    var cardList = [];
    //_generateNotificationCards();
    return Scaffold(
      backgroundColor: Colors.red[50],
      appBar: AppBar(
        title: const Text('සේවා ලැයිස්තුව'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SafeArea(child: SizedBox()),
            FutureBuilder<dynamic>(
              future: CatcherServicesApi.getPendingServices(int.parse(auth.userName!)),
              builder: (context, snapshot) {
                if (kDebugMode) {
                  print(snapshot.data);
                  print("object");
                }
                if(snapshot.hasData) {
                  return StackedNotificationCards(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 2.0,
                      )
                    ],
                    notificationCardTitle: 'පණිවුඩය',
                    notificationCards: _generateNotificationCards(snapshot.data!) ?? [NotificationCard(date: DateTime.now(), leading: const Text("Accepted Requests"), title: "No Available requests", subtitle: "Try Again Later")],
                    cardColor: const Color(0xFF50C878),
                    padding: 16,
                    // actionTitle: const Text(
                    //   'දැනුම්දීම්',
                    //   style: TextStyle(
                    //     fontSize: 24,
                    //     fontWeight: FontWeight.bold,
                    //     color: Colors.black, // Set the text color to black
                    //   ),
                    // ),
                    actionTitle: Container(),
                    showLessAction: const Text(
                      'අඩුවෙන් පෙන්වන්න',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black, // Set the text color to black
                      ),
                    ),
                    onTapClearAll: () {
                      setState(() {
                        _notificationData1.clear();
                      });
                    },
                    clearAllNotificationsAction: const Icon(
                      Icons.close,
                      color: Colors.black, // Set the icon color to black
                    ),
                    clearAllStacked: const Text(
                      'සියල්ල හිස් කරන්න',
                      style: TextStyle(
                        color: Colors.black, // Set the text color to black
                      ),
                    ),
                    cardClearButton: const Text(
                      'සිදු කර ඇත',
                      style: TextStyle(
                        color: Colors.black, // Set the text color to black
                      ),
                    ),
                    cardViewButton: const Text(
                      'බලන්න',
                      style: TextStyle(
                        color: Colors.black, // Set the text color to black
                      ),
                    ),
                    onTapClearCallback: (index) {
                      if (kDebugMode) {
                        print(index);
                      }
                      setState(() {
                        _notificationData1.removeAt(index);
                      });
                    },
                    onTapViewCallback: (index) {
                      int reqId = snapshot.data![index]['requestServiceId'];
                      if (kDebugMode) {
                        print(snapshot.data);
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (
                            context) => ServiceInfo(reqId: reqId)),
                      );
                      if (kDebugMode) {
                        print(index);
                      }
                    },
                  );
                }
                else{
                    return const Center(child: Text("No Data Available Try again later."));
                  // return Scaffold(
                    // appBar: ,
                    // body: Center(child: Text("No Data Available Try again later.")),
                  // );
                }
              }
            ),
          ],
        ),
      ),
    );
  }
}

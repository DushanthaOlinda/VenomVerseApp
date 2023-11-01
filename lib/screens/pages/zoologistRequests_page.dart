import 'package:VenomVerse/screens/pages/zoologistRequestForm_page.dart';
import 'package:VenomVerse/services/api_user_control.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:stacked_notification_cards/stacked_notification_cards.dart';


class ZoologistRequestsPage extends StatefulWidget {
  const ZoologistRequestsPage({Key? key}) : super(key: key);

  @override
  State<ZoologistRequestsPage> createState() => _ZoologistRequestsPageState();
}

class _ZoologistRequestsPageState extends State<ZoologistRequestsPage> {
  final List<NotificationCard> _listOfNotification = [
    NotificationCard(
      date: DateTime.now(),
      leading: const Icon(
        Icons.account_circle,
        size: 48,
      ),
      title: 'S.D.Perera',
      subtitle: 'S.D.Perera has requested to be a catcher',
    ),
    NotificationCard(
      date: DateTime.now().subtract(
        const Duration(minutes: 4),
      ),
      leading: const Icon(
        Icons.account_circle,
        size: 48,
      ),
      title: 'John Alvis',
      subtitle: 'John Alvis has requested to be a catcher',
    ),
    NotificationCard(
      date: DateTime.now().subtract(
        const Duration(minutes: 10),
      ),
      leading: const Icon(
        Icons.account_circle,
        size: 48,
      ),
      title: 'Sayuru Madimbada',
      subtitle: 'Sayuru Madimbada has requested to be a catcher',
    ),
    NotificationCard(
      date: DateTime.now().subtract(
        const Duration(minutes: 30),
      ),
      leading: const Icon(
        Icons.account_circle,
        size: 48,
      ),
      title: 'Buwaneka Rajapakse',
      subtitle: 'Buwaneka Rajapakse has requested to be a catcher',
    ),
    NotificationCard(
      date: DateTime.now().subtract(
        const Duration(minutes: 44),
      ),
      leading: const Icon(
        Icons.account_circle,
        size: 48,
      ),
      title: 'Anton Piyadasa',
      subtitle: 'Anton Piyadasa has requested to be a catcher',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    Future<List<Map<String, dynamic>>> toBecomeZoologist = UserApi.getZoologistReq();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Approve Zoologists"),
      ),
      backgroundColor: Colors.red [50],
      body: SingleChildScrollView(
        child: FutureBuilder<List<Map<String, dynamic>>>(
          future: toBecomeZoologist,
          builder: (context, snapshot) {
            if (kDebugMode) {
              print(snapshot.data);
            }
            return Column(
              children: [
                StackedNotificationCards(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      blurRadius: 2.0,
                    )
                  ],
                  notificationCardTitle: 'Message',
                  notificationCards: getZoologistNotification(snapshot.data)??[..._listOfNotification],
                  cardColor: const Color(0xFFF1F1F1),
                  padding: 16,
                  actionTitle: const Text(
                    'Notifications',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  showLessAction: const Text(
                    'Show less',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                  onTapClearAll: () {
                    setState(() {
                      _listOfNotification.clear();
                    });
                  },
                  clearAllNotificationsAction: const Icon(Icons.close),
                  clearAllStacked: const Text('Clear All'),
                  cardClearButton: const Text('clear'),
                  cardViewButton: const Text('view'),
                  onTapClearCallback: (index) {
                    if (kDebugMode) {
                      print(index);
                    }
                    setState(() {
                      _listOfNotification.removeAt(index);
                    });
                  },
                  onTapViewCallback: (index) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ZoologistRequestForm(data: snapshot.data![index],)),
                    );
                    if (kDebugMode) {
                      print(index);
                    }
                  },
                ),
              ],
            );
          }
        ),
      ),

    );
  }
}

getZoologistNotification(List<Map<String, dynamic>>? data) {
  print(data);
  return data?.map((e) =>     NotificationCard(
    date: DateTime.now().subtract(
      const Duration(minutes: 4),
    ),
    leading: const Icon(
      Icons.account_circle,
      size: 48,
    ),
    title: e["userFirstName"],
    subtitle: e["degreeName"],
  )).toList();
}
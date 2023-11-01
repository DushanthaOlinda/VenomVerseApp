import 'package:VenomVerse/services/catcher_services_api.dart';
import 'package:stacked_notification_cards/stacked_notification_cards.dart';
import 'package:flutter/material.dart';
import 'requestform_details.dart';

class RequestsList extends StatefulWidget {
  const RequestsList({super.key});

  @override
  State<RequestsList> createState() => _RequestsListState();
}

class _RequestsListState extends State<RequestsList> {
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
    Future<List<dynamic>> catcherData = CatcherServicesApi.getBecomeCatcher();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pending Requests'),
      ),
      backgroundColor: Colors.red [50],
      body: SingleChildScrollView(
        child: FutureBuilder<List<dynamic>>(
          future: catcherData,
          builder: (context, snapshot) {
            if (snapshot.hasData){
              List<NotificationCard>? notiData = snapshot.data?.map((e) => NotificationCard(date: DateTime.parse(e["dob"]), leading: const Text("Request"), title: e["description"], subtitle: e["specialNote"])).toList();
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
                    notificationCards: notiData ?? [..._listOfNotification],
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
                      setState(() {
                        _listOfNotification.removeAt(index);
                      });
                    },
                    onTapViewCallback: (index) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RequestForm(data: snapshot.data![index])),
                      );
                    },
                  ),
                ],
              );
            }else{
              return const Text("Loading");
            }
          }
        ),
      ),
    );
  }

}

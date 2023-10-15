import 'package:VenomVerse/screens/pages/catcher/service_info.dart';
import 'package:stacked_notification_cards/stacked_notification_cards.dart';
import 'package:flutter/material.dart';

class ServiceRequests extends StatefulWidget {
  const ServiceRequests({super.key});

  @override
  State<ServiceRequests> createState() => _ServiceRequestsState();
}

class _ServiceRequestsState extends State<ServiceRequests> {
  final List<Map<String, dynamic>> _notificationData = [
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

  List<NotificationCard> _generateNotificationCards() {
    final List<NotificationCard> notificationCards = [];

    for (var data in _notificationData) {
      notificationCards.add(NotificationCard(
        date: DateTime.now().subtract(
          Duration(minutes: notificationCards.length * 4),
        ),
        leading: const Icon(
          Icons.account_circle,
          size: 48,
        ),
        title: data['title'] as String,
        subtitle: data['subtitle'] as String,
      ));
    }

    return notificationCards;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[50],
      body: SingleChildScrollView(
        child: Column(
          children: [
            StackedNotificationCards(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 2.0,
                )
              ],
              notificationCardTitle: 'පණිවුඩය',
              notificationCards: _generateNotificationCards(),
              cardColor: const Color(0xFF50C878),
              padding: 16,
              actionTitle: const Text(
                'දැනුම්දීම්',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Set the text color to black
                ),
              ),
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
                  _notificationData.clear();
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
                print(index);
                setState(() {
                  _notificationData.removeAt(index);
                });
              },
              onTapViewCallback: (index) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ServiceInfo()),
                );
                print(index);
              },
            ),
          ],
        ),
      ),
    );
  }
}

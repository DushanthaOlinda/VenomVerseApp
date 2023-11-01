import 'package:flutter/material.dart';
import 'package:stacked_notification_cards/stacked_notification_cards.dart';

import 'addnewarticle_page.dart';

class NewArticlePage extends StatefulWidget {
  const NewArticlePage({Key? key}) : super(key: key);

  @override
  State<NewArticlePage> createState() => _NewArticlePageState();
}

class _NewArticlePageState extends State<NewArticlePage> {
  final List<NotificationCard> _listOfNotification = [
    NotificationCard(
      date: DateTime.now(),
      leading: const Icon(
        Icons.account_circle,
        size: 48,
      ),
      title: 'S.D.Perera',
      subtitle: 'Title of the article 1',
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
      subtitle: 'Title of the article 1',
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
      subtitle: 'Title of the article 1',
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
      subtitle: 'Title of the article 1',
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
      subtitle: 'Title of the article 1',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Approve Article"),
      ),
      backgroundColor: Colors.red [50],
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
              notificationCardTitle: 'Message',
              notificationCards: [..._listOfNotification],
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
                print(index);
                setState(() {
                  _listOfNotification.removeAt(index);
                });
              },
              onTapViewCallback: (index) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddNewArticlePage()),
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
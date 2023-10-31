import 'package:VenomVerse/screens/pages/postDetails_page.dart';
import 'package:flutter/material.dart';
import 'package:stacked_notification_cards/stacked_notification_cards.dart';

class Post {
  final String name;
  final String category;
  final DateTime requestedDate;
  final List<String> imagePaths; // List of image paths

  const Post({
    required this.name,
    required this.category,
    required this.requestedDate,
    required this.imagePaths,
  });
}

class PostRequestsPage extends StatefulWidget {
  const PostRequestsPage({Key? key}) : super(key: key);

  @override
  State<PostRequestsPage> createState() => _PostRequestsPageState();
}

class _PostRequestsPageState extends State<PostRequestsPage> {
  final List<NotificationCard> _listOfNotification = [
    NotificationCard(
      date: DateTime.now(),
      leading: const Icon(
        Icons.account_circle,
        size: 48,
      ),
      title: 'S.D.Perera',
      subtitle: 'title of the article',
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
      subtitle: 'title of the article',
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
      subtitle: 'title of the article',
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
      subtitle: 'title of the article',
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
      subtitle: 'title of the article',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Approve Articles"),
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
              notificationCardTitle: 'category name',
              notificationCards: [..._listOfNotification],
              cardColor: const Color(0xFFF1F1F1),
              padding: 16,
              actionTitle: const Text(
                'Requests',
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
                  MaterialPageRoute(
                      builder: (context) =>  PostDetailsPage()),
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



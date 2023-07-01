import 'package:VenomVerse/screens/pages/home_page.dart';
import 'package:VenomVerse/screens/pages/learn_page.dart';
import 'package:VenomVerse/screens/pages/notification_page.dart';
import 'package:VenomVerse/screens/pages/profile_page.dart';
import 'package:flutter/material.dart';
// import '../widgets/generate_body.dart';

class GenerateBody extends StatefulWidget {

  const GenerateBody({super.key, required this.role});

  final String role;

  @override
  State<GenerateBody> createState() => _GenerateBodyState();
}

class _GenerateBodyState extends State<GenerateBody> {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  set selectedIndex(int value) {
    _selectedIndex = value;
  }
  Map pages = {
    'Home': const HomePage(),
    'Notifications': const NotificationPage(),
    'Learn' : const LearnPage(),
    'Profile': const ProfilePage(),
  };

  String currentPage = "Home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.green,
          onTap: _onTap,
          currentIndex: selectedIndex,
          showUnselectedLabels: true,
          // elevation: ,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: "Notifications",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.camera_alt),
              label: "Scanner",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: "Learn",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
          ]),
    );
  }

  void _onTap(int index) {
    setState(() {
      selectedIndex = index;
      switch (selectedIndex) {
        case 0:
          currentPage = "Home";
          break;
        case 1:
          currentPage = "Notifications";
          break;
        case 2:
          Navigator.pushNamed(context, '/');
          break;
        case 3:
          currentPage = "Learn";
          break;
        case 4:
          currentPage = "Profile";
          break;
      }
      // super.context.page = currentPage;
    });
  }
}

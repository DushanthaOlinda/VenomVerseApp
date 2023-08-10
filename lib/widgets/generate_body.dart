import 'package:VenomVerse/screens/pages/home_page.dart';
import 'package:VenomVerse/screens/pages/learn_page.dart';
import 'package:VenomVerse/screens/pages/notification_page.dart';
import 'package:VenomVerse/screens/pages/profile_page.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';
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
    'Learn': const LearnPage(),
    'Profile': const ProfilePage(),
  };

  String currentPage = "Home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[currentPage],
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.camera),
          onPressed: () {
            Navigator.pushNamed(context, '/scan');
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar(
          // selectedIconTheme: const IconThemeData(color: Colors.green),
          // selectedLabelStyle: const TextStyle(
          //   fontWeight: FontWeight.bold,
          // ),
          // unselectedIconTheme: const IconThemeData(color: Colors.white),
          activeColor: Colors.brown,
          inactiveColor: Colors.white,
          backgroundColor: Colors.green,
          onTap: _onTap,
          gapLocation: GapLocation.center,
          activeIndex: selectedIndex,
          icons: const [
            Icons.home,
            Icons.notifications,
            Icons.school,
            Icons.person,
          ],
          // currentIndex: selectedIndex,
          // showUnselectedLabels: true,
          // elevation: ,
          // items: const [
          //   BottomNavigationBarItem(
          //     icon: Icon(Icons.home),
          //     label: "Home",
          //     backgroundColor: Colors.brown,
          //   ),
          //   BottomNavigationBarItem(
          //     icon: Icon(Icons.notifications),
          //     label: "Notifications",
          //     backgroundColor: Colors.brown,
          //   ),
          //   BottomNavigationBarItem(
          //     icon: Icon(Icons.camera_alt),
          //     label: "Scanner",
          //     backgroundColor: Colors.brown,
          //   ),
          //   BottomNavigationBarItem(
          //     icon: Icon(Icons.school),
          //     label: "Learn",
          //     backgroundColor: Colors.brown,
          //   ),
          //   BottomNavigationBarItem(
          //     icon: Icon(Icons.person),
          //     label: "Profile",
          //     backgroundColor: Colors.brown,
          //   ),
          // ]),
        ));
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
          currentPage = "Learn";
          break;
        case 3:
          currentPage = "Profile";
          break;
      }
      // super.context.page = currentPage;
    });
  }
}

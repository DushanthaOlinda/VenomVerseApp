import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final List navbarItems;

  const BottomNavBar({super.key, required this.navbarItems, });

  // State<BottomNavigationBarExample> createState() =>
  //     _BottomNavigationBarExampleState();


  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      // fixedColor: const Color.fromRGBO(26, 77, 46, 1),
      selectedItemColor: const Color.fromRGBO(21,45,45,1),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.image), label: "Label"),
        BottomNavigationBarItem(icon: Icon(Icons.image), label: "Label"),
        BottomNavigationBarItem(icon: Icon(Icons.image), label: "Label"),
        BottomNavigationBarItem(icon: Icon(Icons.image), label: "Label"),
        BottomNavigationBarItem(icon: Icon(Icons.image), label: "Label"),
      ],
    );
  }
}

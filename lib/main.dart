import 'package:VenomVerse/screens/homescreen.dart';
import 'package:VenomVerse/screens/loading_screen.dart';
import 'package:VenomVerse/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        primaryColor: const Color.fromRGBO(26, 77, 46, 1)
      ),
      // home: const MyHomePage(title: "VenomVerse"),
      // initialRoute: '/home',
      routes: {
        '/': (context) => const LoadingScreen(),
        '/home' : (context) => const MyHomePage(title: "VenomVerse"),
      },
    );
  }
}

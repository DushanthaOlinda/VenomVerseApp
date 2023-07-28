import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            // SafeArea(child: Icon(Icons.person)),
            // Center(),
            Text("Email"),
            Text("Name"),
            Text("Phone"),
            Text("Address"),
            // Icon(Icons.person)
          ],
        ),
      ),
    );
  }
}

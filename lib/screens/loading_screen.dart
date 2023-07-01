import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadHome(context);
  }

  @override
  Widget build(BuildContext context) {
    // loadHome(context);
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image(
          image: AssetImage('assets/images/logo.png'),
        ),
      ),
    );
  }
}

void loadHome(BuildContext context) {
  // BuildContext context;
  Future.delayed(const Duration(seconds: 3),
      () => {Navigator.pushReplacementNamed(context, '/home')});
}

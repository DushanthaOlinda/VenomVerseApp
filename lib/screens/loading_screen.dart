// import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    loadHome(context);
    return   const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image(
          image: AssetImage('assets/images/logo.png'),
        ),
      ),
    );
  }


  // Set<Future<Set<Future<Object?>>>> Function() any = ()=> {
  //   Future.delayed(const Duration(seconds: 3), () => {
  //   Navigator.pushReplacementNamed(context as BuildContext, '/home')
  // })
  // };


}


void loadHome(BuildContext context) {
  // BuildContext context;
  Future.delayed(const Duration(seconds:3), () => {
    Navigator.pushReplacementNamed(context, '/home')
  });
}
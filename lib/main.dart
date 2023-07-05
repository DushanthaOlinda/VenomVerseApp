import 'package:VenomVerse/screens/home_screen.dart';
import 'package:VenomVerse/screens/loading_screen.dart';
import 'package:VenomVerse/screens/scan_screen.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  // Ensure that plugin services are initialized so that `availableCameras()`
// can be called before `runApp()`
  WidgetsFlutterBinding.ensureInitialized();

// Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

// Get a specific camera from the list of available cameras.
  final firstCamera = cameras.first;
  runApp(MyApp(
    camera: firstCamera,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.camera});
  final CameraDescription camera;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColor: Colors.green,
      ),
      // home: const MyHomePage(title: "VenomVerse"),
      // initialRoute: '/home',
      routes: {
        '/': (context) => const LoadingScreen(),
        '/home': (context) => const MyHomePage(title: "VenomVerse"),
        '/scan': (context) => ScanImage(
              camera: camera,
            ),
      },
    );
  }
}

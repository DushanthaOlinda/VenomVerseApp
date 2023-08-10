import 'package:VenomVerse/screens/home_screen.dart';
import 'package:VenomVerse/screens/image_scan/scan_screen.dart';
import 'package:VenomVerse/screens/image_scan/select_from_gallery.dart';
import 'package:VenomVerse/screens/loading_screen.dart';
import 'package:VenomVerse/screens/login_screen.dart';
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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColor: Colors.green,
      ),
      // home: const MyHomePage(title: "VenomVerse"),
      // initialRoute: '/selectImage',
      routes: {
        '/': (context) => const LoadingScreen(),
        '/login': (context) => const LoginPage(),
        '/home': (context) => const MyHomePage(title: "VenomVerse"),
        '/scan': (context) => ScanImage(
              camera: camera,
            ),
        '/selectImage': (context) => const SelectImageFromGallery(),
      },
    );
  }
}

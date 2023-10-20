// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDMnUGXQnQ40-6PPTUaqVswwaIoZ774qOk',
    appId: '1:21540028356:web:126ef25028ba9f5d966e91',
    messagingSenderId: '21540028356',
    projectId: 'venomverse-ba46f',
    authDomain: 'venomverse-ba46f.firebaseapp.com',
    storageBucket: 'venomverse-ba46f.appspot.com',
    measurementId: 'G-MHQ9FYQMD9',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAJU5IUtEgT2eP0EYIxgFqLqOYgg46dC-w',
    appId: '1:21540028356:android:4f4a3f8bdea8ad6f966e91',
    messagingSenderId: '21540028356',
    projectId: 'venomverse-ba46f',
    storageBucket: 'venomverse-ba46f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBEjOly58Flu9fudSmTj47M7XVxq0GdcQE',
    appId: '1:21540028356:ios:10eca7d6e7ace5b8966e91',
    messagingSenderId: '21540028356',
    projectId: 'venomverse-ba46f',
    storageBucket: 'venomverse-ba46f.appspot.com',
    iosClientId: '21540028356-5g7vksa5ae1dn3e71d4mesvpalpvafdf.apps.googleusercontent.com',
    iosBundleId: 'com.example.venomverse',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBEjOly58Flu9fudSmTj47M7XVxq0GdcQE',
    appId: '1:21540028356:ios:10eca7d6e7ace5b8966e91',
    messagingSenderId: '21540028356',
    projectId: 'venomverse-ba46f',
    storageBucket: 'venomverse-ba46f.appspot.com',
    iosClientId: '21540028356-5g7vksa5ae1dn3e71d4mesvpalpvafdf.apps.googleusercontent.com',
    iosBundleId: 'com.example.venomverse',
  );
}

import 'package:VenomVerse/screens/home_screen.dart';
import 'package:VenomVerse/screens/image_scan/scan_screen.dart';
import 'package:VenomVerse/screens/pages/profile_page.dart';
import 'package:VenomVerse/services/api.dart';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:provider/provider.dart';

import '../models/auth.dart';

const users = {
  'dribbble@gmail.com': '12345',
  'hunter@gmail.com': 'hunter',
};

class LoginPage extends StatelessWidget {
  const LoginPage({super.key, required this.camera});

  final CameraDescription camera;

  Duration get loginTime => const Duration(milliseconds: 2250);

  Future<String?> _authUser(LoginData data) async {
    // debugPrint('Name: ${data.name}, Password: ${data.password}');
    var res = await Api().login(data.name, data.password);
    if (kDebugMode) {
      print(res);
    }
    return res;
  }

  Future<String?> _signupUser(SignupData data) {
    debugPrint('Signup Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  Future<String> _recoverPassword(String name) {
    debugPrint('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'User not exists';
      }
      return 'abc';
    });
  }

  @override
  Widget build(BuildContext context) {
    var auth = context.watch<AuthModel>();

    if (auth.isAuthorized) {
      return ScanImage(camera: camera);
      return const MyHomePage(title: "VenomVerse");
    }

    return FlutterLogin(
      logo: const AssetImage('assets/images/logo.png'),
      onLogin: (LoginData data) async {
        auth.logout();
        var res = await Api().login(data.name, data.password);
        if (res != null) {
          auth.login(res["token"]);
          auth.userSetup(res["username"], res["email"]);
        }
        if (auth.isAuthorized) {
          return "Login Success";
        } else {
          return "Invalid Credentials";
        }
      },
      onSignup: (SignupData data) async {
        auth.logout();
        var res = await Api().signup(data.name, data.password);
        return res;
      },
      onSubmitAnimationCompleted: () {
        if (auth.isAuthorized) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushReplacementNamed(context, '/home');
          });
        } else {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushReplacementNamed(context, '/login');
          });
        }
      },
      onRecoverPassword: _recoverPassword,
    );
  }

  void loadHomePage(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/home');
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthModel extends ChangeNotifier {
  final storage = const FlutterSecureStorage();
  String? _token;
  bool isAuthorized = false;

  init() async {
    _token = await storage.read(key: 'token');

    isAuthorized = _token != null;

    notifyListeners();
  }

  login(String token) async {
    storage.write(key: 'token', value: token);

    _token = token;
    isAuthorized = true;

    notifyListeners();
  }

  logout() {
    _token = null;
    isAuthorized = false;
    storage.delete(key: 'token');

    notifyListeners();
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthModel extends ChangeNotifier {
  final storage = const FlutterSecureStorage();

  // For authentication

  String? _token;
  bool isAuthorized = false;

  // For authorization
  String? userName;
  String? userEmail;
  // bool adminPrivileges = false;
  bool expertPrivilege = false;
  bool zoologistPrivilege = false;
  bool catcherPrivilege = false;
  bool communityAdminPrivilege = false;




  init() async {
    _token = await storage.read(key: 'token');

    isAuthorized = _token != null;


    userName = await storage.read(key: 'userName');
    userEmail = await storage.read(key: 'userEmail');
    // isAuthorized = _token != null;
    if(await storage.read(key: 'expertPrivilege') == null){
      expertPrivilege = false;
    }
    if (await storage.read(key: 'zoologistPrivilege') == null){
      zoologistPrivilege = false;
    }
    if (await storage.read(key: 'communityAdminPrivilege') == null){
      communityAdminPrivilege = false;
    }
    if (await storage.read(key: 'catcherPrivilege') == null){
      catcherPrivilege = false;
    }

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

    clearUser();

    notifyListeners();
  }


  userSetup(String userName, String userEmail, {bool expert = false, bool zoologist = false, bool catcher = false, bool comAdmin = false}) async {    // storage.write(key: 'token', value: token);

    // setting keys in the storage

    storage.write(key: 'userName', value: userName);
    storage.write(key: 'userEmail', value: userEmail);

    if (expert){
      storage.write(key: 'expertPrivilege', value: 'true');
    }
    if (zoologist){
      storage.write(key: 'zoologistPrivilege', value: 'true');
    }
    if (catcher){
      storage.write(key: 'catcherPrivilege', value: 'true');
    }
    if(comAdmin){
      storage.write(key: 'communityAdminPrivilege', value: 'true');
    }
    notifyListeners();
  }


  clearUser() async {
    userName = null;
    userEmail = null;
    expertPrivilege = false;
    zoologistPrivilege = false;
    catcherPrivilege = false;
    communityAdminPrivilege = false;

    // Deleting keys from storage

    storage.delete(key: 'userName');
    storage.delete(key: 'userEmail');
    storage.delete(key: 'expertPrivilege');
    storage.delete(key: 'zoologistPrivilege');
    storage.delete(key: 'catcherPrivilege');
    storage.delete(key: 'communityAdminPrivilege');


    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();


    notifyListeners();
  }


}
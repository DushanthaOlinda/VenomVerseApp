import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'api.dart';

class UserApi extends Api {
  Future<Map<String, dynamic>> getUser(int? userName) async {
    Map<String, dynamic> userDetails = {};
    if (userName == null) {
      userDetails["userId"] = null;
      return userDetails;
    }
    print(userName);
    String fullUrl = "${mainUrl}UserDetail/$userName";

    Response response = await http.get(
      Uri.parse(fullUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 404) {
      userDetails["userId"] = null;
      return userDetails;
    }
    Map<String, dynamic> jsonMap = json.decode(response.body);
    jsonMap.forEach((key, value) {
      userDetails[key] = value;
    });
    return userDetails;
  }

  static Future<void> editUser(Map<String, dynamic> json) async {
    print("Editing");
    String fullUrl = "${mainUrl}UserDetail/${json["userId"]}";
    Response response = Response("Before Req", 404);

    try {
      response = await http.post(Uri.parse(fullUrl),
          body: jsonEncode(json),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }

    if (response.statusCode != 201) {
      print("Error: ${response.body}");
    }
  }

  static Future<void> addNewUser(Map<String, dynamic> json) async {
    print("Adding");
    print(jsonEncode(json));
    String fullUrl = "${mainUrl}UserDetail";

    Response response = Response("Before Req", 404);

    try {
      response = await http.post(Uri.parse(fullUrl),
          body: jsonEncode(json),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }

    if (response.statusCode != 201) {
      print("Error: ${response.body}");
    }
  }
}

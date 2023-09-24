import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'api.dart';

class UserApi extends Api {

  Future<Map<String, dynamic>> getUser(int? userName) async {
    Map<String, dynamic> userDetails = {};
    if(userName == null){
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

    if (response.statusCode == 404){
      userDetails["userId"] = null;
      return userDetails;
    }
    Map<String, dynamic> jsonMap = json.decode(response.body);
    jsonMap.forEach((key, value) {
        userDetails[key] = value;
    });
    return userDetails;
  }

}
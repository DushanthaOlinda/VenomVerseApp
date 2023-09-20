import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'api.dart';

class UserApi extends Api {


  getUser(int? userName) async {
    if(userName == null){
      return 'Invalid user name';
    }

    String fullUrl = "${mainUrl}UserDetail/$userName";

    if (kDebugMode) {
      print(fullUrl);
    }

    Response response = await http.post(
      Uri.parse(fullUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 404) return null;
    Map<String, dynamic> jsonMap = json.decode(response.body);
    Iterable list = jsonMap.values;
    return list.elementAtOrNull(0).toString();
  }

}
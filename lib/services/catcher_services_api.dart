import 'dart:convert';

import 'package:VenomVerse/services/api.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class CatcherServicesApi extends Api{
  static Future<List<Map<String, dynamic>>> getPendingServices(int? userName) async {

    String fullUrl = "${mainUrl}UserDetail/$userName";

    Response response = await http.get(
      Uri.parse(fullUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 404) {

    }
    var jsonMap = json.decode(response.body);
    if (kDebugMode) {
      print(jsonMap);
    }
    return jsonMap;
  }
}
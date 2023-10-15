import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import 'api.dart';

class LearnContentApi extends Api {
  static Future<List> getAllBooks() async {
    Map<String, dynamic> posts = {};
    String fullUrl = "${mainUrl}api/LearnContent/AllBooks";

    Response response = await http.get(
      Uri.parse(fullUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 404) {
      posts["userId"] = null;
      // return posts;
    }
    // List<Map<String, dynamic>> jsonMap = json.decode(response.body);
    List<dynamic> jsonMap = json.decode(response.body);

    print(jsonMap);
    return jsonMap;
  }

  static Future<List> getAllArticles() async {
    Map<String, dynamic> posts = {};
    String fullUrl = "${mainUrl}api/LearnContent/getAllArticle";

    Response response = await http.get(
      Uri.parse(fullUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 404) {
      posts["userId"] = null;
      // return posts;
    }
    // List<Map<String, dynamic>> jsonMap = json.decode(response.body);
    List<dynamic> jsonMap = json.decode(response.body);
    print(jsonMap);
    return jsonMap;
  }



  // TODO: attempt aid - api hadanna one, 


}

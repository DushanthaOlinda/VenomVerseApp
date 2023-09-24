import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import 'api.dart';

class PostApi extends Api {
  Future<List> getAllPosts() async {
    Map<String, dynamic> posts = {};
    String fullUrl = "${mainUrl}api/CommunityPost";

    Response response = await http.get(
      Uri.parse(fullUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 404){
      posts["userId"] = null;
      // return posts;
    }
    // List<Map<String, dynamic>> jsonMap = json.decode(response.body);
    List<dynamic> jsonMap = json.decode(response.body);

    return jsonMap;
  }
}
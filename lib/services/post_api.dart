import 'dart:convert';

import 'package:flutter/foundation.dart';
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

    if (response.statusCode == 404) {
      posts["userId"] = null;
      // return posts;
    }
    // List<Map<String, dynamic>> jsonMap = json.decode(response.body);
    List<dynamic> jsonMap = json.decode(response.body);

    return jsonMap;
  }

  static Future<int> createPost(Map<String, dynamic> json) async {

    // got json string from post and send it to the server
    String fullUrl = "${mainUrl}api/CommunityPost";
    Response response = Response("Before Req", 404);
    try {
      response = await http
          .post(Uri.parse(fullUrl), body: jsonEncode(json), headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      });
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }

    return response.statusCode;
  }

  // static void addComment()

  static void report(Map<String, dynamic> json) {
    // TODO: make report request
  }

  static Future<void> setComment(Map<String, dynamic> json) async {

    // got json string from post and send it to the server
    String fullUrl = "${mainUrl}api/CommunityPost/AddComment/${json["postId"]}";
    Response response = Response("Before Req", 404);
    try {
      response = await http
          .post(Uri.parse(fullUrl), body: jsonEncode(json), headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      });
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}

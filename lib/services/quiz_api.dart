import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import 'api.dart';

class QuizApi extends Api {
  static Future<List> getCompletedQuiz() async {
    String fullUrl = "${mainUrl}Quiz/AllAttempts";

    Response response = await http.get(
      Uri.parse(fullUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    // List<Map<String, dynamic>> jsonMap = json.decode(response.body);
    List<dynamic> jsonMap = json.decode(response.body);

    print(jsonMap);
    return jsonMap;
  }

  static Future<List> getQuizDetails(int uid, int qid) async {
    Map<String, dynamic> posts = {};
    String fullUrl = "${mainUrl}Quiz/GetQuestions/$uid/$qid";
    // TODO: need to replace with correct url

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

  static Future<List> getQuizList() async{
    String fullUrl = "${mainUrl}Quiz";
    Response response = await http.get(
      Uri.parse(fullUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      // body: jsonEncode(attempt),
    );

    // List<Map<String, dynamic>> jsonMap = json.decode(response.body);
    List<dynamic> jsonMap = json.decode(response.body);
    print(jsonMap);
    return jsonMap;
  }

  static Future<List> createAttempt(int aid, int uid, int qid) async {
    String fullUrl = "${mainUrl}Quiz/AttemptQuiz/$aid/$uid/$qid";    // TODO: need to replace with correct url

    var attempt = {
      "quizAttemptId": aid,
      "userId": uid,
      "quizDetailId": qid,
      "submittedTime": "2023-10-14T16:39:31.043Z",
      "totalMarks": 0,
      "userFirstName": "string",
      "userLastName": "string",
      "quizTopicEng": "string",
      "quizTopicSin": "string"
    };
    Response response = await http.post(
      Uri.parse(fullUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(attempt),
    );

    // List<Map<String, dynamic>> jsonMap = json.decode(response.body);
    List<dynamic> jsonMap = json.decode(response.body);
    print(jsonMap);
    return jsonMap;
  }

  static Future<List> submit(Map<String, Object> data) async {

    String fullUrl = "${mainUrl}Quiz/SubmitAnswer/$data['quizUserAnswerId']/$data['quizAttemptId']/$data['questionId']";    // TODO: need to replace with correct url
    Response response = await http.post(
      Uri.parse(fullUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    // List<Map<String, dynamic>> jsonMap = json.decode(response.body);
    List<dynamic> jsonMap = json.decode(response.body);
    if (kDebugMode) {
      print(jsonMap);
    }
    return jsonMap;
  }

}

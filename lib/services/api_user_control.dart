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
    print(json);
    String fullUrl = "${mainUrl}UserDetail/${json["userId"]}";
    Response response = Response("Before Req", 404);

    try {
      response = await http.put(Uri.parse(fullUrl),
          body: jsonEncode(json),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });

      if (kDebugMode) {
        print(response.statusCode);
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }

    if (response.statusCode != 201) {
      if (kDebugMode) {
        print("Error: ${response.body}");
      }
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

  static Future<void> reqToBeCatcher(
      int reqId, int userId, List<String> list) async {
    String fullUrl = "${mainUrl}UserDetail/becameCatcher";
    Response response = Response("Before Req", 404);

    try {
      var data = {
        "reqId": reqId,
        "reqCatcher": userId,
        "catcherEvidence": list
      };
      response = await http.post(Uri.parse(fullUrl),
          body: jsonEncode(data),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }

    if (response.statusCode != 201) {
      if (kDebugMode) {
        print("Error: ${response.body}");
      }
    }
  }

  static Future<void> reqToBeZoologist(
      int reqId,
      int userId,
      List<String> evidence,
      String degreeName,
      String year,
      String university) async {
    String fullUrl = "${mainUrl}UserDetail/becomeZoologist";
    Response response = Response("Before Req", 404);

    try {
      var data = {
        "requestToBeZoologistEvidenceId": reqId,
        "zoologistId": userId,
        "degreeEvidence": evidence,
        "degreeName": degreeName,
        "graduatedYear": year,
        "university": university
      };
      response = await http.post(Uri.parse(fullUrl),
          body: jsonEncode(data),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }

    if (response.statusCode != 201) {
      if (kDebugMode) {
        print("Error: ${response.body}");
      }
    }
  }

  static Future<List<Map<String, dynamic>>> getZoologistReq() async {
    // Zoologist/ViewRequestsToBecomeZoologist
    var fullUrl = "${mainUrl}Zoologist/ViewRequestsToBecomeZoologist";
    Response response =
        await http.get(Uri.parse(fullUrl), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });

    print(response.statusCode);

    if (response.statusCode == 200) {
      print(response.body);
      if(response.body.isEmpty) {
        return [
          {
            "zoologistId": 0,
            "description": "string",
            "specialNote": "string",
            "requestedDateTime": "2023-11-01T00:38:19.132Z",
            "status": 0,
            "approvedPersonId": 0,
            "approvedDate": "2023-11-01",
            "certificate": "string",
            "degreeName": "string",
            "university": "string",
            "graduatedYear": "string",
            "specialDetails": "string",
            "userFirstName": "string",
            "userLastName": "string",
            "userEmail": "string",
            "nic": "string",
            "dob": "2023-11-01",
            "district": "string",
            "address": "string",
            "contactNo": "string",
            "workingStatus": "string",
            "expertPrivilege": true,
            "zoologistPrivilege": true,
            "catcherPrivilege": true,
            "communityAdminPrivilege": true,
            "accountStatus": "string"
          }
        ];
      }
      return json.decode(response.body);
    }


    return [
      {
        "zoologistId": 0,
        "description": "string",
        "specialNote": "string",
        "requestedDateTime": "2023-11-01T00:38:19.132Z",
        "status": 0,
        "approvedPersonId": 0,
        "approvedDate": "2023-11-01",
        "certificate": "string",
        "degreeName": "string",
        "university": "string",
        "graduatedYear": "string",
        "specialDetails": "string",
        "userFirstName": "string",
        "userLastName": "string",
        "userEmail": "string",
        "nic": "string",
        "dob": "2023-11-01",
        "district": "string",
        "address": "string",
        "contactNo": "string",
        "workingStatus": "string",
        "expertPrivilege": true,
        "zoologistPrivilege": true,
        "catcherPrivilege": true,
        "communityAdminPrivilege": true,
        "accountStatus": "string"
      }
    ];
  }

  static Future<void> approveZooloigist(
      int zoologistId, int parse, bool bool) async {
    // venomverser.azurewebsites.net/Zoologist/RespondRequestsToBecomeZoologist?zoologistId=11&approvedUser=22&approveFlag=true' \
    var fullUrl =
        "${mainUrl}Zoologist/RespondRequestsToBecomeZoologist?zoologistId=$zoologistId&approvedUser=$parse&approveFlag=$bool";

    Response response =
        await http.get(Uri.parse(fullUrl), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });
  }
}

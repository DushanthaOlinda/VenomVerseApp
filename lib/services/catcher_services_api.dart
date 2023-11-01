import 'dart:async';
import 'dart:convert';

import 'package:VenomVerse/services/api.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class CatcherServicesApi extends Api {
  static Future<List<Map<String, dynamic>>> getPendingServices(
      int? userName) async {
    String fullUrl = "${mainUrl}UserDetail/$userName";

    Response response = await http.get(
      Uri.parse(fullUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 404) {}
    var jsonMap = json.decode(response.body);
    if (kDebugMode) {
      print(jsonMap);
    }
    return jsonMap;
  }

  static serviceRequestResponse(
      int serviceReqId, int catcherId, bool res) async {
    String fullUrl =
        "${mainUrl}Catcher/ServiceReqResponse/$serviceReqId?catcherId=$catcherId&response=$res";

    Response response =
        await http.put(Uri.parse(fullUrl), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });

    if (response.statusCode == 200 || response.statusCode == 201) {
      return response;
    }
  }

  static Future<List> getAllCatchers() async {
    var mockData = [
      {
        "reqId": 123,
        "reqCatcher": 1695232719640,
        "catcherEvidence": ["any"],
        "description": "abc",
        "specialNote": "abc",
        "approvedPersonIdOne": null,
        "approvedDateOne": null,
        "approvedPersonIdTwo": null,
        "approvedDateTwo": null,
        "approvedPersonIdThree": null,
        "approvedDateThree": null,
        "joinedDate": null,
        "approvedFlag": true,
        "userFirstName": "Test",
        "userLastName": null,
        "userEmail": "dribbble@gmail.com",
        "nic": "200012354587",
        "dob": "2023-09-23",
        "district": "Gampaha",
        "address": "Addresss",
        "contactNo": "0774581256",
        "workingStatus": "Working",
        "expertPrivilege": false,
        "zoologistPrivilege": false,
        "catcherPrivilege": false,
        "communityAdminPrivilege": false,
        "accountStatus": "1"
      },
      {
        "reqId": 1001,
        "reqCatcher": 1000000001001,
        "catcherEvidence": [],
        "description": "Experienced snake handler in Colombo.",
        "specialNote": "Certified by Sri Lanka Herpetological Society.",
        "approvedPersonIdOne": null,
        "approvedDateOne": null,
        "approvedPersonIdTwo": null,
        "approvedDateTwo": null,
        "approvedPersonIdThree": null,
        "approvedDateThree": null,
        "joinedDate": "2023-10-18",
        "approvedFlag": true,
        "userFirstName": "Perera",
        "userLastName": null,
        "userEmail": "user1@email.com",
        "nic": "199012345678",
        "dob": "1990-05-15",
        "district": "Colombo",
        "address": "123 Main Street, Colombo",
        "contactNo": "0712345678",
        "workingStatus": "Teacher",
        "expertPrivilege": true,
        "zoologistPrivilege": true,
        "catcherPrivilege": true,
        "communityAdminPrivilege": true,
        "accountStatus": "1"
      },
      {
        "reqId": 1002,
        "reqCatcher": 1000000001002,
        "catcherEvidence": [],
        "description": "Snake rescue specialist in Galle.",
        "specialNote": "Featured on local TV for snake rescues.",
        "approvedPersonIdOne": null,
        "approvedDateOne": null,
        "approvedPersonIdTwo": null,
        "approvedDateTwo": null,
        "approvedPersonIdThree": null,
        "approvedDateThree": null,
        "joinedDate": null,
        "approvedFlag": true,
        "userFirstName": "Prasad",
        "userLastName": null,
        "userEmail": "user2@email.com",
        "nic": "200112345678",
        "dob": "2001-08-20",
        "district": "Kandy",
        "address": "456 Park Road, Kandy",
        "contactNo": "0723456789",
        "workingStatus": "Student",
        "expertPrivilege": true,
        "zoologistPrivilege": true,
        "catcherPrivilege": true,
        "communityAdminPrivilege": false,
        "accountStatus": "1"
      },
      {
        "reqId": 1003,
        "reqCatcher": 1000000001003,
        "catcherEvidence": [],
        "description": "Snake handler with over 5 years of experience.",
        "specialNote": "Available 24/7 for emergencies.",
        "approvedPersonIdOne": null,
        "approvedDateOne": null,
        "approvedPersonIdTwo": null,
        "approvedDateTwo": null,
        "approvedPersonIdThree": null,
        "approvedDateThree": null,
        "joinedDate": null,
        "approvedFlag": true,
        "userFirstName": "Fernando",
        "userLastName": null,
        "userEmail": "user3@email.com",
        "nic": "198712345678",
        "dob": "1987-12-10",
        "district": "Galle",
        "address": "789 Beach Road, Galle",
        "contactNo": "0734567890",
        "workingStatus": "Farmer",
        "expertPrivilege": true,
        "zoologistPrivilege": true,
        "catcherPrivilege": false,
        "communityAdminPrivilege": true,
        "accountStatus": "1 "
      },
      {
        "reqId": 1004,
        "reqCatcher": 1000000001004,
        "catcherEvidence": [],
        "description": "Professional snake catcher serving Kandy region.",
        "specialNote": "First aid certified for snakebites.",
        "approvedPersonIdOne": null,
        "approvedDateOne": null,
        "approvedPersonIdTwo": null,
        "approvedDateTwo": null,
        "approvedPersonIdThree": null,
        "approvedDateThree": null,
        "joinedDate": null,
        "approvedFlag": true,
        "userFirstName": "Thathsarani",
        "userLastName": null,
        "userEmail": "user4@email.com",
        "nic": "200512345678",
        "dob": "2005-03-25",
        "district": "Matara",
        "address": "101 River Lane, Matara",
        "contactNo": "0712345678",
        "workingStatus": "Student",
        "expertPrivilege": true,
        "zoologistPrivilege": true,
        "catcherPrivilege": false,
        "communityAdminPrivilege": false,
        "accountStatus": "1 "
      },
      {
        "reqId": 1005,
        "reqCatcher": 1000000001005,
        "catcherEvidence": [],
        "description": "Snake rescue expert covering Ratnapura area.",
        "specialNote": "Handles all snake species, including venomous ones.",
        "approvedPersonIdOne": null,
        "approvedDateOne": null,
        "approvedPersonIdTwo": null,
        "approvedDateTwo": null,
        "approvedPersonIdThree": null,
        "approvedDateThree": null,
        "joinedDate": "2023-10-14",
        "approvedFlag": true,
        "userFirstName": "Bandara",
        "userLastName": null,
        "userEmail": "user5@email.com",
        "nic": "199912345678",
        "dob": "1999-04-12",
        "district": "Jaffna",
        "address": "555 Lake Road, Jaffna",
        "contactNo": "0723456789",
        "workingStatus": "Postman",
        "expertPrivilege": true,
        "zoologistPrivilege": false,
        "catcherPrivilege": true,
        "communityAdminPrivilege": true,
        "accountStatus": "1"
      }
    ];

    String fullUrl = "${mainUrl}Catcher/GetAllApprovedCatchers";

    Response response =
        await http.get(Uri.parse(fullUrl), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });

    if (response.statusCode == 200) {
      // print(json.decode(response.body));
      List data = json.decode(response.body);
      return data;
      response.body;
    }
    return mockData;
  }

  static Future<List<Map<String, String>>> completedRequests(
      int catcherId) async {
    // https://venomverser.azurewebsites.net/Catcher/AllRequestsCompleted/1695232719640
    String fullUrl = "${mainUrl}Catcher/AllRequestsCompleted/$catcherId";

    Response response =
        await http.get(Uri.parse(fullUrl), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });

    print(response.statusCode);

    if (response.statusCode == 200) {
      // print(json.decode(response.body));
      List<Map<String, String>> data = json.decode(response.body);
      // if (data == null) {
      //   return [
      //     {'date': "No Data", 'details': "No Data", 'Location': "No Data"}
      //   ];
      // }
      data
          .map((e) => {
                'date': e["dateTime"],
                'details': e["ratingComment"],
                'Location': e["catcherFeedback"]
              })
          .toList();
      return data;
      // response.body;
    }
    return [
      {'date': "No Data", 'details': "No Data", 'Location': "No Data"}
    ];

    // return mockData;
  }

  static Future<Map<String, dynamic>> getService(int reqId) async {
    String fullUrl = "${mainUrl}Catcher/ViewRequest/$reqId";
    Response response =
        await http.get(Uri.parse(fullUrl), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });

    if (response.statusCode == 200) {
      return json.decode(response.body);
    }

    return {
      "requestServiceId": 5,
      "reqUserId": 1695232719640,
      "catcherId": null,
      "dateTime": "2023-10-31T16:59:03.9468235Z",
      "scannedImageLink": null,
      "scannedImageId": null,
      "selectedSerpent": null,
      "rate": 0,
      "ratingComment": null,
      "catcherMedia": null,
      "catcherFeedback": null,
      "serviceFeedback": null,
      "serviceFeedbackMedia": null,
      "reqUserFirstName": "Drible",
      "reqUserLastName": "Test",
      "catcherFirstName": null,
      "catcherLastName": null,
      "scanImgUrl":
          "https://firebasestorage.googleapis.com/v0/b/venomverse-ba46f.appspot.com/o/ScannedImages%2F2023-10-31%2014%3A59%3A33.805464Z.png?alt=media&token=282a65c1-66f7-42ad-ab1b-367fd0604265"
    };
  }

  static Future<void> completeReq(int parse, String s, int reqId) async {
    String fullUrl =
        "${mainUrl}Catcher/CompleteServiceReq/$reqId?catcherId=$parse&feedback=$s";

    Response response = await http.put(Uri.parse(fullUrl),
        body: jsonEncode({"Comment"}),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });
  }
}

import 'dart:convert';
import 'dart:io';
import 'package:async/async.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'package:path/path.dart';
// import 'package:async/async.dart';
import '../models/auth.dart';

class Api {

  String mainUrl = "https://venomverser.azurewebsites.net/";
  signup(String? email, String? password) async {
    if (email == null || password == null) {
      return "Invalid email or password";
    }
    var fullUrl = "${mainUrl}Auth/register";

    String username = DateTime.now().millisecondsSinceEpoch.toString();
    Response response = await http.post(
      Uri.parse(fullUrl),
      body: jsonEncode({
        "registrationRequestId": 0,
        "email": email,
        "username": username,
        "password": password
      }),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    print(response.statusCode);
    if (response.statusCode == 201) return null;
    Map<String, dynamic> jsonMap = json.decode(response.body);
    Iterable list = jsonMap.values;
    print(list.first);
    return list.elementAtOrNull(0).toString();
  }

  login(String email, String password) async {
    var fullUrl = '${mainUrl}Auth/login';

    Response response = await http.post(
      Uri.parse(fullUrl),
      body: jsonEncode({"email": email, "password": password}),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    // print(jsonDecode(response.body));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return null;
    }
  }

  logout() async {
    // var fullUrl = 'https://venomverseapi.azurewebsites.net/Auth/login';
    var fullUrl = '${mainUrl}Auth/Logout';
    Response response = await http.post(
      Uri.parse(fullUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    return jsonDecode(response.body);
  }

  static scanSnake(File imageFile) async {
    // var stream = http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    var stream = http.ByteStream(imageFile.openRead());
    stream.cast();

    var length = await imageFile.length();

    var fullUrl = 'https://us-central1-detdeploy.cloudfunctions.net/prediction';

    var request = http.MultipartRequest("POST", Uri.parse(fullUrl));

    var multipartFile = http.MultipartFile('file', stream, length,
        filename: basename(imageFile.path));

    // add file to multipart
    request.files.add(multipartFile);

    // send
    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);
    var responseBody = response.body;

    if (response.statusCode != 200) {
      return {"class": 'Not Detected', 'message': '0'};
    }

    // listen for response
    return jsonDecode(responseBody);
    return {"class": 'Not Detected', 'message': '0'};
  }
}

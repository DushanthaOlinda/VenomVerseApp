import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../models/auth.dart';

class Api {

  login(String email, String password) async {

    var fullUrl = 'https://venomverseapi.azurewebsites.net/Auth/login';
    // var fullUrl = 'https://google.com/';
    // print(fullUrl);
    // Response response = await http.get(
    //   Uri.parse(fullUrl),
    // );
    Response response = await http.post(
      Uri.parse(fullUrl),
      body: jsonEncode({"email": email, "password": password}),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    // print(jsonDecode(response.body));
    if (response.statusCode == 200){
      return jsonDecode(response.body);

    } else{
      return null;
    }
  }

  logout() async {
    var fullUrl = 'https://venomverseapi.azurewebsites.net/Auth/login';

    Response response = await http.post(
      Uri.parse(fullUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    return jsonDecode(response.body);
  }
}

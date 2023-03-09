import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_tutorial_day_1/constants.dart';

class Networking {
  // Future<bool> authenticate(username, password) async {
  //
  //   Map<String, String> header = {"Content-Type": "application/json"};
  //   Map<String, String> body = {"username": username, "password": password};
  //
  //   //normally included inside a try catch block
  //
  //   http.Response response = await http.post(Uri.http(SERVER_NAME, '/auth'),
  //       headers: header, body: jsonEncode(body));
  //
  //   return response.statusCode==200? true : false;
  //
  // }

  Future<http.Response> serverGet(String endpoint) async {
    http.Response response = await http.get(Uri.http(SERVER_NAME, endpoint));
    return response;
  }
}

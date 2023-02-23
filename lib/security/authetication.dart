import 'dart:convert';
import 'package:http/http.dart' as http;

const serverName = 'localhost:3002';

class Authenticator {

  Future<bool> authenticate(username, password) async {

    Map<String, String> header = {"Content-Type": "application/json"};
    Map<String, String> body = {"username": username, "password": password};

  //normally included inside a try catch block

    http.Response response = await http.post(Uri.http(serverName, '/auth'),
        headers: header, body: jsonEncode(body));

    return response.statusCode==200? true : false;

  }
}

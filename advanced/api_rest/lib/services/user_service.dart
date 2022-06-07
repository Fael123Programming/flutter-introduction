import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:api_rest/models/user/user.dart';

class UserService {
  Future<User?> getUserByUsername(String username) async {
    final url = 'https://jsonplaceholder.typicode.com/users?username=$username';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List responseList = json.decode(response.body);
      if (responseList.isNotEmpty) {
        return User.fromMap(responseList.first);
      }
    }
    return null;
  }
}

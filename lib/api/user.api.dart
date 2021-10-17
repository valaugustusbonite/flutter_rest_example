import 'dart:convert';

import 'package:rest_api/model/user.dart';
import 'package:http/http.dart' as http;

class UserAPIService {

  Future<List<User>> getUsers() async {
    const String apiURL = 'https://reqres.in/api/users?page=1';
    final response = await http.get(
      Uri.parse(apiURL),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> dataResponse = jsonDecode(response.body);
      final users = dataResponse['data'].map<User>((data) => User.fromJson(data as Map<String, dynamic>)).toList() as List<User>;
      
      return users;
    } else {
      throw Exception('Failed to load album');
    }

  }

  Future<User> getUser(int id) async {
    final String apiURL = 'https://reqres.in/api/users/$id';
    final response = await http.get(
      Uri.parse(apiURL),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> dataResponse = jsonDecode(response.body);
     
      final user = dataResponse['data'];
      
      return user;
    } else {
      throw Exception('Failed to load album');
    }
  }
}
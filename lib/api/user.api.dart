import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rest_api/model/user.dart';
import 'package:http/http.dart' as http;

class UserAPIService {

  final String baseURL = 'https://reqres.in';
  

  Future<List<User>> getUsers() async {

    try {
      ///This is the API endpoint
      final apiURL = '$baseURL/api/users?page=1';
      ///This is making the get request
      ///This returns JSON data
      final response = await http.get(
        Uri.parse(apiURL),
      );

      Map<String, dynamic> dataResponse = jsonDecode(response.body);

      ///mapping through list of map data to instantiate a new User using the User.fromJson Constructor
      final users = dataResponse['data'].map<User>((data) => User.fromJson(data as Map<String, dynamic>)).toList() as List<User>;

      ///retuning the list of users
      return users;
      
    } catch (e) {
      throw Exception(e);
    }
  }

  ///////FUNCTION TWO

  Future<User> getUser(int id) async {
    final String apiURL = 'https://reqres.in/api/users/$id';
    try {
      final response = await http.get(Uri.parse(apiURL));
      Map<String, dynamic> dataResponse = jsonDecode(response.body);
     
      final user = User.fromJson(dataResponse);
      return user;
    } catch (e) {
      throw Exception(e);
    }
    
  }

}
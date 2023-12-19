import 'dart:convert';

import 'package:app/config.dart';
import 'package:app/models/auth/login_model.dart';
import 'package:app/models/auth/register_model.dart';
import 'package:http/http.dart' as http;

class AuthService {
  Future<http.Response> login(LoginModel model) async {
    final response = await http.post(Uri.parse("$baseUrl/auth/connect-token"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, String>{
          'email': model.email,
          'password': model.password
        }));

    return response;
  }

  Future<http.Response> register(RegisterModel model) async {
    final response = await http.post(Uri.parse("$baseUrl/auth/register"),
        headers: <String, String>{
          'Content-Type': "application/json; charset=utf-8"
        },
        body: jsonEncode(<String, String>{
          'name': model.name,
          'surname': model.surname,
          'email': model.email,
          'password': model.password
        }));

    return response;
  }
}

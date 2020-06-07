import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import './api_url.dart';

class Auth with ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  String _userId;

  Future<void> signUp(String email, String password) async {
    final url = ApiUrl().FIREBASE_AUTH;

    final response = await http.post(
      url,
      body: json.encode(
        {
          'email': email,
          'password': password,
          'retunSecureToken': true,
        },
      ),
    );
    print(json.decode(response.body));
  }
}

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../DTOs/user_login_DTO.dart';

class LoginProvider extends ChangeNotifier {
  Future postDataUser(
      String email, String password, BuildContext context) async {
    final user = UserLoginDto(correo: email, password: password);
    print(user);
    final response = await http.post(
      Uri.parse('https://192.168.0.166/api/login/Tutor'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user),
    );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('User created!')),
      );
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${response.statusCode}!')),
      );
    }
  }
}

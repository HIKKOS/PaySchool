import 'package:flutter/material.dart';
import 'package:payschool/pages/Home.dart';
import 'package:payschool/pages/Login.dart';
import 'package:payschool/widgets/form_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IsLogged extends StatelessWidget {
  const IsLogged({super.key});
  _getLoginState() async {
    final prefs = await SharedPreferences.getInstance();
    final isLogged = prefs.getBool('checkboxValue') ?? false;
    return isLogged;
  }

  @override
  Widget build(BuildContext context) {
    bool isLogged = _getLoginState();
    return isLogged ? const HomePage() : const LoginPage();
    //return LoginPage();
  }
}

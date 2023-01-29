import 'package:flutter/material.dart';
import 'package:hola_mundo/pages/Home.dart';
import 'package:hola_mundo/pages/Login.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      routes: {
        '/': (context) => const LoginPage(),
        'Home': (context) => const HomePage(),
      },
    );
  }
}

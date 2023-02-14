import 'package:flutter/material.dart';
import 'package:hola_mundo/pages/catalog_service.dart';
import 'package:hola_mundo/widgets/NavbarAlfa.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: NavBar(),
    );
  }
}

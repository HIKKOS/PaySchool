import 'package:flutter/material.dart';
import 'package:hola_mundo/widgets/Nav_bar.dart';

void main() => runApp(const Principal());

 class Principal extends StatelessWidget {
  const Principal({super.key});

  @override
  Widget build(BuildContext context) {
    return const   MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavBar(),

    );
  }
  
}
//Pau branch
//añadido
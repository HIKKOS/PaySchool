import 'package:flutter/material.dart';
import 'package:hola_mundo/pages/perfil_page.dart';
void main() => runApp(const Principal());

 class Principal extends StatelessWidget {
  const Principal({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PerfilPage(),
    );
  }
  
}
//Pau branch
//añadido
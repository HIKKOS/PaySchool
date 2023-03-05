import 'package:flutter/material.dart';
import 'package:hola_mundo/Provider/tutor_provider.dart';
import 'package:hola_mundo/widgets/Nav_bar.dart';
import 'package:provider/provider.dart';

void main() => runApp(const Principal());

class Principal extends StatelessWidget {
  const Principal({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TutoProvider()..fetchTutorInfo(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,

        home: NavBar(),
      ),
    );
  }
}
//Pau branch
//añadido
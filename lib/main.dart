import 'package:flutter/material.dart';
import 'package:hola_mundo/core/entities/Beneficiario.dart';
import 'package:hola_mundo/pages/BeneficiarioPage.dart';
import 'package:hola_mundo/pages/Home.dart';
import 'package:hola_mundo/pages/Login.dart';

void main() => runApp(MaterialApp(
      title: 'Material App',
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        'Home': (context) => const HomePage(),
        'DetallesBeneficiario': (context) => const BeneficiarioPage()
      },
    ));

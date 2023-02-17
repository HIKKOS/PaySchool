import 'package:flutter/material.dart';

class CambioPasswordPage extends StatelessWidget {
  const CambioPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: const Center(
          child: Text('Hola soy la pagina del cambio de contraseña'),
        ),
      ),
    );
  }
}

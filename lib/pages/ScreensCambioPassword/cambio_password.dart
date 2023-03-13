import 'package:flutter/material.dart';
import 'package:payschool/pages/perfil_page.dart';
import 'package:payschool/widgets/Texts/EditableText.dart';
import 'package:payschool/widgets/form_cambioPassword.dart';


class CambioPasswordPage extends StatelessWidget {
  const CambioPasswordPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Cambio Contraseña',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 24, color: Colors.blue),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () => Navigator.of(context)
                .pop(MaterialPageRoute(builder: (context) => PerfilPage())),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.grey,
            ),
          ),
        ),
        body: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: const Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: TextoEditable(
                      label:
                          'Ingresa tu correo electronico, en el recibiras un enlace para poder cambiar tu contraseña'),
                ),
                SizedBox(height: 5),
                form_cambioPassword(),
              ],
            ),
          ),
        ));
  }
}



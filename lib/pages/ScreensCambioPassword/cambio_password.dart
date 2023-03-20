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
            child: ListView(
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: TextoEditable(
                      label:
                          'Bienvenido al cambio de contraseña. Es importante que tengas a mano tu contraseña actual para hacer el cambio'),
                ),
                SizedBox(height: 5),
                form_cambioPassword(),
              ],
            ),
          ),
        ));
  }
}

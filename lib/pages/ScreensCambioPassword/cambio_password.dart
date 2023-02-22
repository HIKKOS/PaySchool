import 'package:flutter/material.dart';
import 'package:hola_mundo/pages/ScreensCambioNumeroT/cambio_telefono_secondPage.dart';
import 'package:hola_mundo/pages/ScreensCambioPassword/cambio_password_secondPage.dart';
import 'package:hola_mundo/pages/perfil_page.dart';
import 'package:hola_mundo/widgets/Texts/EditableText.dart';
import 'package:hola_mundo/widgets/Buttons/customButton.dart';
import 'package:hola_mundo/widgets/inputs/Editable_input_TextField.dart';

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
            onPressed: () => Navigator.of(context).pop(
                MaterialPageRoute(builder: (context) => const PerfilPage())),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.grey,
            ),
          ),
        ),
        body: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              children:  [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: TextoEditable(
                      label:
                          'Ingresa tu correo electronico, en el recibiras un enlace para poder cambiar tu contraseña'),
                ),
                const SizedBox(height: 5),
                const InputTextField(
                  label: 'Correo electronico',
                  hint: 'example@gmail.com',
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: CustomButton(
                      horizontal: 80,
                      vertical: 20,
                      label: 'enviar',
                      function: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const  CambioPasswordSecondPage()));
                      }),
                ),
              ],
            ),
          ),
        ));
  }
}

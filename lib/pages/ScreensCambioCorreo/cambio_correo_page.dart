import 'package:flutter/material.dart';
import 'package:hola_mundo/pages/ScreensCambioCorreo/cambioCorreoSecondPage.dart';
import 'package:hola_mundo/pages/perfil_page.dart';
import 'package:hola_mundo/widgets/Texts/EditableText.dart';
import 'package:hola_mundo/widgets/Buttons/customButton.dart';
import 'package:hola_mundo/widgets/inputs/Editable_input_TextField.dart';

class CambioCorreoPage extends StatelessWidget {
  const CambioCorreoPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Cambio Correo',
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
                          'Escribe el nuevo correo, en el recibiras un codigo de verificacion'),
                ),
                const SizedBox(height: 5),
                const InputTextField(
                  label: 'Correo Electronico',
                  hint: 'correo@ejemplo.com',
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: CustomButton(
                      horizontal: 80,
                      vertical: 20,
                      label: 'Enviar',
                      function: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const  CambioCorreoSecondPage()));
                      }),
                ),
              ],
            ),
          ),
        ));
  }
}

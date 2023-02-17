import 'package:flutter/material.dart';
import 'package:hola_mundo/screens/ScreensCambioCorreo/cambio_correo_page.dart';
import 'package:hola_mundo/widgets/Texts/EditableText.dart';
import 'package:hola_mundo/widgets/Buttons/Editable_customButton.dart';
import 'package:hola_mundo/widgets/inputs/Editable_input_TextField.dart';

class CambioCorreoSecondPage extends StatelessWidget {
  const CambioCorreoSecondPage({
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
                MaterialPageRoute(builder: (context) => const CambioCorreoPage())),
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
                          'Escribe el codigo de verificacion que recibiste'),
                ),
                const SizedBox(height: 5),
                const InputTextField(
                  label: 'Código de verificación',

                  hint: '1kZuwU',
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: CustomButton(
                      horizontal: 80,
                      vertical: 20,
                      label: 'Verificar',
                      function: () {
                        //Navigator.of(context).push(MaterialPageRoute(
                            //builder: (context) => const  CambioCorreoSecondPage()));
                      }),
                ),
              ],
            ),
          ),
        ));
  }
}

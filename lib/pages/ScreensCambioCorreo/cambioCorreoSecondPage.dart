import 'package:flutter/material.dart';
import 'package:payschool/pages/ScreensCambioCorreo/cambio_correo_page.dart';
import 'package:payschool/widgets/Buttons/button_alert.dart';
import 'package:payschool/widgets/Texts/EditableText.dart';
import 'package:payschool/widgets/inputs/Editable_input_TextField.dart';

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
            onPressed: () => Navigator.of(context).pop(MaterialPageRoute(
                builder: (context) => const CambioCorreoPage())),
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
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: TextoEditable(
                      label: 'Escribe el codigo de verificacion que recibiste'),
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
                    child: AlertButton(
                      horizontal: 80,
                      vertical: 20,
                      titulo: 'Alerta',
                      contenido: 'Tu correo se ha cambiado de manera exitosa',
                      function: () {
                        Navigator.pop(context);
                      },
                    )),
              ],
            ),
          ),
        ));
  }
}

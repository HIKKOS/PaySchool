import 'package:flutter/material.dart';
import 'package:hola_mundo/screens/ScreensCambioNumeroT/cambio_telefono.dart';
import 'package:hola_mundo/widgets/Buttons/button_alert.dart';
import 'package:hola_mundo/widgets/Texts/EditableText.dart';
import 'package:hola_mundo/widgets/inputs/Editable_input_TextField.dart';

class CambioTelefonoSecondPage extends StatelessWidget {
  const CambioTelefonoSecondPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Cambio Telefono',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 24, color: Colors.blue),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(
                MaterialPageRoute(builder: (context) => const CambioTelefonoPage())),
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
              children:   [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: TextoEditable(
                      label:
                          'Verifica el codigo que se ha mandado a 123 456 7890'),
                ),
                const SizedBox(height: 5),
                const InputTextField(
                  label: 'Código de verificación',

                  hint: '123456',
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
                    contenido: 'El codigo se ha verificado de manera exitosa',
                     function: (){
                      Navigator.pop(context);
                     },
                    ),
                ),
              ],
            ),
          ),
        ));
  }
}


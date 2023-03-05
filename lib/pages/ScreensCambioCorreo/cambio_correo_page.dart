import 'package:flutter/material.dart';
import 'package:hola_mundo/Provider/tutor_provider.dart';
import 'package:hola_mundo/pages/perfil_page.dart';
import 'package:hola_mundo/widgets/Texts/EditableText.dart';
import 'package:hola_mundo/widgets/Buttons/customButton.dart';
import 'package:provider/provider.dart';

class CambioCorreoPage extends StatelessWidget {
  const CambioCorreoPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final correoController = TextEditingController();
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
            onPressed: () {
              Navigator.of(context)
                  .pop(MaterialPageRoute(builder: (context) => PerfilPage()));
            },
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
                      label:
                          'Escribe el nuevo correo, en el recibiras un codigo de verificacion'),
                ),
                const SizedBox(height: 5),
                TextFormField(
                  controller: correoController,
                  decoration: const InputDecoration(
                    hintText: 'correo@ejemplo.com',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Consumer<TutoProvider>(
                  builder: (context, tutorProv, child) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: CustomButton(
                        horizontal: 80,
                        vertical: 20,
                        label: 'Enviar',
                        function: () {
                          tutorProv.ActualizarCorreo(correoController.text);
                          Navigator.pop(context);
                          print('push');
                        }),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

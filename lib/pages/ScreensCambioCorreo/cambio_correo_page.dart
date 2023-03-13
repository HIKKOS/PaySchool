import 'package:flutter/material.dart';
import 'package:payschool/pages/perfil_page.dart';
import 'package:payschool/widgets/Texts/EditableText.dart';
import 'package:payschool/widgets/form_cambioCorreo.dart';


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
            child:  const Column(
              children: [
                 Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: TextoEditable(
                      label:
                          'Escribe el nuevo correo, en el recibiras un codigo de verificacion'),
                ),
                 SizedBox(height: 5),
                 form_CambioCorreo(),
              ],
            ),
          ),
        ));
  }
}



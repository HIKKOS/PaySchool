import 'package:flutter/material.dart';
import 'package:payschool/data/tokenService.dart';
import 'package:payschool/pages/perfil_page.dart';
import 'package:payschool/widgets/Texts/EditableText.dart';
import 'package:payschool/widgets/form_cambioCorreo.dart';


class CambioCorreoPage extends StatelessWidget {

   CambioCorreoPage({
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
            child:   ListView(
              children: const [
                 Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: TextoEditable(
                      label:
                          'Ingresa un nuevo correo.Al final se le enviará un mensaje al mismo confirmando el cambio.'),
                ),
                 SizedBox(height: 5),  
                 form_CambioCorreo(),
              ],
              
            ),
          ),
        ));
  }
}



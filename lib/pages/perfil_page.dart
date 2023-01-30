import 'package:flutter/material.dart';
import 'package:hola_mundo/widgets/cambioCorreo_Widget.dart';
import 'package:hola_mundo/widgets/navbar_Widget.dart';
import 'package:hola_mundo/widgets/perfil_widget.dart';
import 'package:hola_mundo/widgets/telefono_Widget.dart';


class PerfilPage extends StatelessWidget{
  const PerfilPage ({super.key});

@override
Widget build(BuildContext context) {
  return Scaffold(
       backgroundColor: Colors.white,
       appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Text(
            'Perfil',
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Color(0xFF176BFC),
              fontSize: 24,
            ),
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.grey.shade600,
          ), onPressed: () {  },),
       ),
       body: Column(
        children: const [
          Align(
            alignment: Alignment.bottomCenter,
            child: EditProfile(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: CambioCorreo(),
            ),
            CambioTelefono(),
            Padding(
                  padding: EdgeInsets.symmetric(vertical: 30),
                  child: Text('Cerrar Sesion',
                      style: TextStyle(fontSize: 15, color: Color(0xFF176BFC),fontWeight: FontWeight.bold)),
                ),
        ],
        
       ),
       bottomNavigationBar: const NavbarAlfa(),
      );
  }
}
// ignore: file_names
import 'package:flutter/material.dart';
import 'package:hola_mundo/pages/perfil_page.dart';
import 'package:hola_mundo/widgets/customButtom_Widget.dart';
import 'package:hola_mundo/widgets/inputTextField_Widget.dart';
import 'package:hola_mundo/widgets/textsection_Widget.dart';


class CorreoPage extends StatelessWidget{
  const CorreoPage({super.key});
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
            'Cambio de correo',
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
          ), onPressed: () {
             Navigator.of(context).push(MaterialPageRoute(builder:(context) => const PerfilPage()));
            },),
       ),
       body :ListView(
        children: [
          textSection,
           const InputTextField(
            label: 'Correo Electrónico',
             hint: 'Correo electrónico'
             ),
             Padding(padding: const EdgeInsets.symmetric(vertical: 30),
             child:CustomButton(
                    horizontal: 10,
                    vertical: 18,
                    function: () {
                    }), 
             )
        ],
            
       )
    );
  }
}
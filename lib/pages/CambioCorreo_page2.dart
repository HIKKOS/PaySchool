// ignore: file_names
import 'package:flutter/material.dart';
import 'package:hola_mundo/pages/cambioCorreo_page.dart';
import 'package:hola_mundo/widgets/customButtom_Widget.dart';
import 'package:hola_mundo/widgets/inputTextField_Widget.dart';
import 'package:hola_mundo/widgets/textsection_Widget.dart';


class CorreoPage2 extends StatelessWidget{
  const CorreoPage2 ({super.key});
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
             Navigator.of(context).push(MaterialPageRoute(builder:(context) => const CorreoPage()));
            },),
       ),
       body :ListView(
        children: [
          const Padding(padding: EdgeInsets.all(32),
          child: Text(
             'Escribe el codigo de verificacion que recibiste',
              style: TextStyle(fontSize: 20, color: Colors.grey),
              softWrap: true,
          ),
          ),
           const InputTextField(
            label: 'Codigo de Verificacion',
             hint: '1kZuwU'
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
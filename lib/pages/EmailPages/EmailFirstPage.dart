import 'package:flutter/material.dart';
import 'package:hola_mundo/widgets/Textos/TextSection.dart';
import 'package:hola_mundo/widgets/customButton.dart';
import 'package:hola_mundo/widgets/inputs/inputTextField.dart';

class EmailFirstPage extends StatelessWidget {
  const EmailFirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white60,
        title: const  Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Text(
            'Cambio Correo',
            textAlign: TextAlign.left,
             style: TextStyle(
              fontSize: 24,
              color: Color(0xFF176BFC),
              ),
          ),
           ),
           automaticallyImplyLeading: false,
      ),
      body: ListView(
       children: [
        textSection,
        const InputTextField(
            label: 'Correo Electrónico',
             hint: 'Correo electrónico'
             ),
             const SizedBox(height: 10,),
              Padding(padding: const  EdgeInsets.symmetric(vertical :30),
             child: CustomButton(
              horizontal: 10,
              vertical: 18,
              function: (){
              //Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CorreoPage2()));
              }),
             )
       ],
      ),
    );
  }
}

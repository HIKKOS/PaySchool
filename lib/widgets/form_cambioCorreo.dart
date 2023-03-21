// ignore: file_names
import 'package:flutter/material.dart';
import 'package:payschool/providers/tutor_provider.dart';
import 'package:payschool/widgets/Buttons/customButton.dart';
import 'package:payschool/widgets/inputs/Editable_input_TextField.dart';
import 'package:provider/provider.dart';

// ignore: camel_case_types
class form_CambioCorreo extends StatefulWidget {
  const form_CambioCorreo({
    super.key,
  });

  @override
  State<form_CambioCorreo> createState() => _form_CambioCorreoState();
}

// ignore: camel_case_types
class _form_CambioCorreoState extends State<form_CambioCorreo> {
  // ignore: non_constant_identifier_names
  final form_key = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: form_key,
      child: Column(
        children: [
             Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
             child: Padding(
               padding: const EdgeInsets.symmetric(horizontal: 15 , vertical: 10),
               child: TextFormField(
                  controller: emailController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Ingresa un correo';
                    } else {
                      if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                          .hasMatch(value)) {
                        return 'El correo no es valido';
                      }
                      return null;
                    }
                  },
                  decoration:
                      const InputDecoration(hintText: 'correo@ejemplo.com',
                      border: InputBorder.none
                      )
                      ),
             ),
           ), 
/*             InputTextField(
            validator : (value){
          if (value!.isEmpty) {
                return 'Campo Requerido';
              } else {
                if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                    .hasMatch(value)) {
                  return 'El correo no es valido';
                }
                return null;
              }
            },
            controller: emailController,
            label: 'Email', 
            hint: 'Example@gmail.com'
            ), */
          const SizedBox(height: 20),
            Consumer<TutorProvider>(
            builder: (context, tutorProv, child) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: CustomButton(
                  horizontal: 60,
                  vertical: 20,
                  label: 'Enviar',
                  function: () {
                    final form = form_key.currentState;
                    if(form!.validate()){
                        tutorProv.ActualizarCorreo(emailController.text);
                    Navigator.pop(context);
                    print('push');
                    }
                  }),
            ),
          ) 
        ],
      ),
    );
  }
}

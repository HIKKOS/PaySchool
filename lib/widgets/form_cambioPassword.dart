// ignore: file_names
import 'package:flutter/material.dart';
import 'package:payschool/DTOs/user_passwordDTO.dart';
import 'package:payschool/providers/tutor_provider.dart';
import 'package:payschool/widgets/Buttons/customButton.dart';
import 'package:provider/provider.dart';

// ignore: camel_case_types
class form_cambioPassword extends StatefulWidget {
  const form_cambioPassword({
    super.key,
  });

  @override
  State<form_cambioPassword> createState() => _form_cambioPasswordState();
}

// ignore: camel_case_types
class _form_cambioPasswordState extends State<form_cambioPassword> {
  // ignore: non_constant_identifier_names
  final form_key = GlobalKey<FormState>();
  // ignore: non_constant_identifier_names
  final actualPcontroller = TextEditingController();
  final nuevoPController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: form_key,
      child: Column(
        children: [
          TextFormField(
            controller: actualPcontroller,
            decoration: const InputDecoration(hintText: 'Contraseña actual'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Campo Requerido';
              } else {
                if (value.length < 8) {
                  return 'contraseña no valida';
                }
              }
              return null;
            },
          ),
          TextFormField(
            obscureText: true,
            controller: nuevoPController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Campo Requerido';
              } else {
                if (value.length < 8) {
                  return 'contraseña no valida';
                }
                return null;
              }
            },
            decoration: const InputDecoration(hintText: 'Contraseña'),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Consumer<TutorProvider>(
              builder: (context, tutorProv, child) => CustomButton(
                  horizontal: 80,
                  vertical: 20,
                  label: 'Enviar',
                  function: () {
                    final form = form_key.currentState;
                    if (form!.validate()) {
                      tutorProv.ActualizarPassword(actualPcontroller.text, nuevoPController.text, context);
                      print('push');
                    }
                  }),
            ),
          ),
        ],
      ),
    );
  }
}

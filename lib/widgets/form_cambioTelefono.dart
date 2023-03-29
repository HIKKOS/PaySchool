// ignore: file_names
import 'package:flutter/material.dart';
import 'package:payschool/providers/tutor_provider.dart';
import 'package:payschool/widgets/Buttons/customButton.dart';
import 'package:provider/provider.dart';

// ignore: camel_case_types
class form_cambioTelefono extends StatefulWidget {
  const form_cambioTelefono({
    super.key,
  });

  @override
  State<form_cambioTelefono> createState() => _form_cambioTelefonoState();
}

// ignore: camel_case_types
class _form_cambioTelefonoState extends State<form_cambioTelefono> {
  // ignore: non_constant_identifier_names
  final form_key = GlobalKey<FormState>();
  final numberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: form_key,
      child: Column(
        children: [
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: TextFormField(
                controller: numberController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Campo Requerido';
                  } else {
                    if (!RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(value)) {
                      return 'El numero no es valido';
                    }else{
                      if(value.length<10  || value.length >10){
                          return 'El numero no es valido';
                      }
                      return null;
                    }
                  }
                },
                decoration: const InputDecoration(
                  hintText: '99 92 86 32 84',
                     border: InputBorder.none
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Consumer<TutorProvider>(
            builder: (context, tutorProv, child) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: CustomButton(
                  horizontal: 80,
                  vertical: 20,
                  label: 'Enviar',
                  function: () {
                    final form = form_key.currentState;
                    if(form!.validate()){
                        tutorProv.Actualizarnumero(numberController.text);
                    Navigator.pop(context);
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

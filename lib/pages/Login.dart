import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hola_mundo/data/repositories/app_colors.dart';
import 'package:hola_mundo/pages/Home.dart';
import 'package:hola_mundo/widgets/InputPasswordField.dart';
import 'package:hola_mundo/widgets/InputTextField.dart';

import '../widgets/CustomButton.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Login',
        home: Scaffold(
          backgroundColor: AppColors.greyLight,
          body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 35,
                ),
                SvgPicture.asset(
                  'assets/Icons/Icon.svg',
                  height: 110,
                  width: 110,
                ),
                const Text(
                  'Bienvenido',
                  style: TextStyle(fontSize: 48, color: AppColors.primary),
                ),
                SizedBox(
                  height: 40,
                ),
                const InputTextField(
                    label: 'Correo Electrónico', hint: 'Correo electrónico'),
                const InputTextPassword(
                    label: 'Contraseña', hint: 'Contraseña'),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 30),
                  child: Text('¿Olvidó su contraseña?',
                      style: TextStyle(fontSize: 18, color: AppColors.primary)),
                ),
                CustomButton(
                    horizontal: 100,
                    vertical: 14,
                    function: () {
                      Navigator.pushNamed(context, 'Home');
                    }),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: true,
                        onChanged: (a) {},
                      ),
                      const Text('Recordarme',
                          style: TextStyle(
                              fontSize: 18, color: AppColors.greyDark)),
                      const SizedBox(
                        width: 10,
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('¿Nuevo usuario?',
                        style:
                            TextStyle(fontSize: 18, color: AppColors.greyDark)),
                    Text('obtenga ayuda',
                        style:
                            TextStyle(fontSize: 18, color: AppColors.primary)),
                  ],
                )
              ]),
        ));
  }
}

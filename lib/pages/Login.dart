import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hola_mundo/data/repositories/app_colors.dart';
import 'package:hola_mundo/providers/login_provider.dart';
import 'package:hola_mundo/widgets/form_login.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width - 20;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.greyLight,
      body: Center(
        child: SizedBox(
          width: width,
          child: Column(
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
                const SizedBox(
                  height: 40,
                ),
                const FormLogin(),
                /* const InputTextField(
                    label: 'Correo Electrónico', hint: 'Correo electrónico'),
                const InputTextPassword(
                    label: 'Contraseña', hint: 'Contraseña'),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 30),
                  child: Text('¿Olvidó su contraseña?',
                      style: TextStyle(fontSize: 18, color: AppColors.primary)),
                ), */
                /* CustomButton(
                    horizontal: 100,
                    vertical: 14,
                    function: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NavBar()));
                    }), */
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
                /*  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    /* Text('¿Nuevo usuario?',
                        style:
                            TextStyle(fontSize: 18, color: AppColors.greyDark)), */
                    /* Text('obtenga ayuda',
                        style:
                            TextStyle(fontSize: 18, color: AppColors.primary)), */
                  ],
                ) */
              ]),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:payschool/providers/tutor_provider.dart';
import 'package:provider/provider.dart';
import '../data/providers/services_provider.dart';
import '../data/repositories/app_colors.dart';
import '../providers/alumno_provider.dart';
import '../widgets/BottomNavBar.dart';
import '../widgets/form_login.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AlumnoProvider>(
            create: (context) => AlumnoProvider()),
        ChangeNotifierProvider<ServicesProvider>(
            create: (context) => ServicesProvider()),
        ChangeNotifierProvider<TutorProvider>(
            create: (context) => TutorProvider()),
      ],
      child: const NavBar(),
    );
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
              ]),
        ),
      ),
    );
  }
}

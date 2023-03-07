import 'dart:convert';
import 'package:payschool/data/Config.dart';
import 'package:payschool/providers/alumno_provider.dart';
import 'package:payschool/widgets/BottomNavBar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:payschool/widgets/CustomButton.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../DTOs/user_login_DTO.dart';
import '../data/providers/services_provider.dart';
import '../data/repositories/app_colors.dart';
import '../pages/catalog_service.dart';

var logger = Logger(
  printer: PrettyPrinter(),
);

class FormLogin extends StatefulWidget {
  const FormLogin({super.key});

  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  final urlBase = UrlValue.baseUrl;
  String email = "Correo";
  String password = "Password";
  bool isLoading = false;
  Future _login(String email, String password, BuildContext context) async {
    setState(() {
      isLoading = true;
    });
    final user = UserLoginDto(correo: email, password: password);
    try {
      final res = await http.post(Uri.parse('$urlBase/login/Tutor'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(user));
      logger.i(urlBase);

      if (res.statusCode != 200) {
        setState(() {
          isLoading = false;
        });
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            'Usuario o contraseña incorrectos',
          ),
          elevation: 10,
          duration: Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
          backgroundColor: Color.fromARGB(200, 0, 0, 0),
        ));
        return false;
      } else {
        final Map<String, dynamic> map = jsonDecode(res.body);
        final String jwt = map['jwt'];
        final prefs = await SharedPreferences.getInstance();
        prefs.setString('jwt', jwt);
        // ignore: use_build_context_synchronously
        MultiProvider(
          providers: [
            ChangeNotifierProvider<ServicesProvider>(
                create: (context) => ServicesProvider()),
          ],
          child: const CatalogService(),
        );
        MultiProvider(
          providers: [
            ChangeNotifierProvider<AlumnoProvider>(
                create: (context) => AlumnoProvider()),
          ],
          child: const CatalogService(),
        );
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => ChangeNotifierProvider(
                    create: (context) => AlumnoProvider()..fetchAlumnos(),
                    child: (const MaterialApp(
                        title: 'Material App', home: NavBar())))));
        return true;
      }
    } on Exception catch (e) {
      logger.e(e);
      setState(() {
        isLoading = false;
      });
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          'Error de red',
        ),
        elevation: 10,
        duration: Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
        backgroundColor: Color.fromARGB(200, 0, 0, 0),
      ));
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    return Form(
      key: formKey,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'Correo electrónico',
              style: TextStyle(
                  fontSize: 20,
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: 'Ingrese su correo',
                  border: InputBorder.none,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Este campo es obligatorio';
                  }
                  return null;
                },
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'Contraseña',
              style: TextStyle(
                  fontSize: 20,
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: TextFormField(
                // initialValue: password ?? '',
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Contraseña',
                  border: InputBorder.none,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Este campo es obligatorio';
                  }
                  return null;
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: isLoading
                ? const CircularProgressIndicator()
                : CustomButton(
                    horizontal: 100,
                    vertical: 14,
                    function: () {
                      email = emailController.text;
                      password = passwordController.text;
                      _login(emailController.text, passwordController.text,
                          context);
                    }),
          )
        ],
      ),
    );
  }
}

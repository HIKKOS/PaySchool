import 'dart:convert';
import 'package:hola_mundo/pages/Home.dart';
import 'package:hola_mundo/providers/alumno_provider.dart';
import 'package:hola_mundo/widgets/BottomNavBar.dart';
import 'package:hola_mundo/widgets/login-btn.dart';
import 'package:localstorage/localstorage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hola_mundo/widgets/CustomButton.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../DTOs/user_login_DTO.dart';
import '../data/repositories/app_colors.dart';

var logger = Logger(
  printer: PrettyPrinter(),
);

class FormLogin extends StatefulWidget {
  const FormLogin({super.key});

  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  final urlBase = '192.168.0.166:8080';
  String email = "Correo";
  String password = "Password";
  bool isLoading = false;
  Future _login(String email, String password, BuildContext context) async {
    setState(() {
      isLoading = true;
    });
    final user = UserLoginDto(correo: email, password: password);
    final res = await http.post(Uri.parse('http://$urlBase/api/login/Tutor'),
        headers: {'Content-Type': 'application/json'}, body: jsonEncode(user));
    if (res.statusCode != 200) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text(
          'Usuario o contraseña incorrectos',
        ),
        elevation: 10,
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
        backgroundColor: const Color.fromARGB(200, 0, 0, 0),
      ));
      return false;
    } else {
      final Map<String, dynamic> map = jsonDecode(res.body);
      final String jwt = map['jwt'];
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('jwt', jwt);
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => ChangeNotifierProvider(
                  create: (context) => AlumnoProvider()..fetchAlumnos(),
                  child: (const MaterialApp(
                      title: 'Material App', home: NavBar())))));
      return true;
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

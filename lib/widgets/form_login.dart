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
  bool _passwordObscure = true;
  bool _isButtonEnabled = true;
  final urlBase = UrlValue.baseUrl;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  Future _login(BuildContext context) async {
    final email = _emailController.text;
    final password = _passwordController.text;
    if (email.isEmpty || password.isEmpty) {
      return ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          'Ambos campos son obligatorios',
          textAlign: TextAlign.center,
        ),
        elevation: 10,
        duration: Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
        backgroundColor: Color.fromARGB(200, 0, 0, 0),
      ));
    }
    setState(() {
      _isButtonEnabled = false;
    });

    final success = await _performLogin(email, password);
    if (success) {
      // ignore: use_build_context_synchronously
      _pushPage(context);
    } else {
      setState(() {
        _isButtonEnabled = true;
      });
    }
  }

  Future _pushPage(BuildContext context) async {
    await Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
                create: (BuildContext context) => AlumnoProvider(),
                child: (const MaterialApp(
                    title: 'Material App', home: NavBar())))));
  }

  Future<dynamic> _performLogin(var email, var password) async {
    try {
      final user = UserLoginDto(correo: email, password: password);
      final res = await http.post(Uri.parse('$urlBase/login/Tutor'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(user));
      if (res.statusCode == 200) {
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
        return true;
      } else {
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
      }
      return false;
    } on Exception catch (e) {
      setState(() {
        _isButtonEnabled = true;
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
    }
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
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
                controller: _emailController,
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
                controller: _passwordController,
                obscureText: _passwordObscure,
                decoration: InputDecoration(
                  hintText: 'Contraseña',
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _passwordObscure = !_passwordObscure;
                      });
                    },
                    icon: _passwordObscure
                        ? const Icon(Icons.visibility)
                        : Icon(Icons.visibility_off),
                  ),
                ),
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: _isButtonEnabled
                  ? CustomButton(
                      horizontal: 100,
                      vertical: 14,
                      function: () {
                        _login(context);
                      })
                  : const CircularProgressIndicator())
        ],
      ),
    );
  }
}

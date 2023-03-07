import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:payschool/DTOs/TutorDto.dart';
import 'package:logger/logger.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../data/Config.dart';

class TutorProvider extends ChangeNotifier {
  final url = UrlValue.baseUrl;
  final logger = Logger();
  bool isLoading = true;
  String urlPhoto = '';
  Tutor? _tutor;

  Tutor? get tutor => _tutor;

  Future fetchTutorInfo() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('jwt');
    final response = await http.get(Uri.parse('$url/Tutores/getInfo'),
        headers: {
          "Content-Type": "application/json",
          "x-token": token.toString()
        });
    logger.d(response.statusCode);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      Tutor t = Tutor.fromJson(json);
      _tutor = t;
      logger.d(_tutor);
      isLoading = false;
      notifyListeners();
    } else {}
  }

  Future ActualizarCorreo(String correo) async {
    Tutor t = Tutor(
        id: _tutor!.id,
        primerNombre: _tutor!.primerNombre,
        segundoNombre: _tutor!.segundoNombre,
        apellidoMaterno: tutor!.apellidoMaterno,
        apellidoPaterno: tutor!.apellidoPaterno,
        foto: _tutor!.foto,
        correo: correo,
        telefono: _tutor!.telefono,
        rfc: _tutor!.rfc,
        direccion: _tutor!.direccion);
    logger.d(t.correo);

    logger.d(json);
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('jwt');
    final response = await http.put(Uri.parse('$url/tutores/mobile/'),
        headers: {
          "Content-Type": "application/json",
          "x-token": token.toString()
        },
        body: jsonEncode(t));
    logger.d(response.statusCode);
    if (response.statusCode == 200) {
      _tutor = t;
      logger.d(response.body);
      print(200);
      /*  final json = jsonDecode(response.body);
      Tutor t = Tutor.fromJson(json);
      _tutor = t;
      logger.d(_tutor); */
      isLoading = false;
      notifyListeners();
    } else {
      print('No se pudo actualizar el correo');
    }
  }

  Future Actualizarnumero(String numero) async {
    Tutor t = Tutor(
        id: _tutor!.id,
        primerNombre: _tutor!.primerNombre,
        segundoNombre: _tutor!.segundoNombre,
        apellidoMaterno: tutor!.apellidoMaterno,
        apellidoPaterno: tutor!.apellidoPaterno,
        foto: _tutor!.foto,
        correo: _tutor!.correo,
        telefono: numero,
        rfc: _tutor!.rfc,
        direccion: _tutor!.direccion);
    logger.d(t.telefono);

    logger.d(json);
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('jwt');
    final response = await http.put(Uri.parse('$url/tutores/mobile/'),
        headers: {
          "Content-Type": "application/json",
          "x-token": token.toString()
        },
        body: jsonEncode(t));
    logger.d(response.statusCode);
    if (response.statusCode == 200) {
      _tutor = t;
      logger.d(response.body);
      print(200);
      /*  final json = jsonDecode(response.body);
      Tutor t = Tutor.fromJson(json);
      _tutor = t;
      logger.d(_tutor);
      isLoading = false; */
      notifyListeners();
    } else {
      print('No se pudo actualizar el numero de telefono');
    }
  }
}

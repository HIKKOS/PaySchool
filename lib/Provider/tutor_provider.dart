import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hola_mundo/DTOs/TutorDto.dart';
import 'package:logger/logger.dart';

import 'package:http/http.dart' as http;

class TutoProvider extends ChangeNotifier {
  final url = '192.168.137.1:8080';
  final logger = Logger();
  bool isLoading = true;
  String urlPhoto = '';
  Tutor? _tutor;

  Tutor? get tutor => _tutor;

  Future fetchTutorInfo() async {
    final response = await http.get(
        Uri.parse(
            'http://$url/api/Tutores/getInfo'),
        headers: {
          "Content-Type": "application/json",
          "x-token":
              "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJJZCI6ImQzYmYxMzVjLWM5N2UtNDk0YS1hMmFhLTlmNGNlMzc3Zjc3NyIsInJvbCI6IlR1dG9yIiwiaWF0IjoxNjc4MTIwMjczLCJleHAiOjE2NzgyMDY2NzN9.pdZW5ouqygiu3X6Nr2A0enqAk3obTqljZHcYgiMx2E0"
        });
    logger. d(response.statusCode);
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
    final response = await http.put(
        Uri.parse(
            'https://rest-server-node-production-109d.up.railway.app/api/tutores/mobile/'),
        headers: {
          "Content-Type": "application/json",
          "x-token":
              "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJJZCI6ImQzYmYxMzVjLWM5N2UtNDk0YS1hMmFhLTlmNGNlMzc3Zjc3NyIsInJvbCI6IlR1dG9yIiwiaWF0IjoxNjc4MTIwMjczLCJleHAiOjE2NzgyMDY2NzN9.pdZW5ouqygiu3X6Nr2A0enqAk3obTqljZHcYgiMx2E0"
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
    final response = await http.put(
        Uri.parse(
            'https://rest-server-node-production-109d.up.railway.app/api/tutores/mobile/'),
        headers: {
          "Content-Type": "application/json",
          "x-token":
              "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJJZCI6ImQzYmYxMzVjLWM5N2UtNDk0YS1hMmFhLTlmNGNlMzc3Zjc3NyIsInJvbCI6IlR1dG9yIiwiaWF0IjoxNjc4MTIwMjczLCJleHAiOjE2NzgyMDY2NzN9.pdZW5ouqygiu3X6Nr2A0enqAk3obTqljZHcYgiMx2E0"
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

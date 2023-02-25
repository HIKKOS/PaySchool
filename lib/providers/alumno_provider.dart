import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hola_mundo/DTOs/alumno_DTO.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AlumnoProvider extends ChangeNotifier {
  bool isLoading = true;
  final logger = Logger();

  List<AlumnoDTO>? _alumnos;
  List<AlumnoDTO>? get getAlumnos => _alumnos;
  Future fetchAlumnos() async {
    var url = Uri.parse('http://192.168.8.33:8080/api/tutores/tutorados');
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('jwt');
    final headersList = {'x-token': token.toString()};
    var respose = await http.get(url, headers: headersList);
    logger.d(respose.statusCode);
    if (respose.statusCode == 200) {
      final json = jsonDecode(respose.body);
      final List<dynamic> data = json['tutorados'];
      _alumnos = data.map((e) => AlumnoDTO.fromJson(e)).toList();
      isLoading = false;
      logger.d(_alumnos);
      notifyListeners();
    }
  }
}

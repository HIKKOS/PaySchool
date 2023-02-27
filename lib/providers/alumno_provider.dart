import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hola_mundo/DTOs/alumno_DTO.dart';
import 'package:hola_mundo/widgets/form_login.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AlumnoProvider extends ChangeNotifier {
  final urlBase = '192.168.0.166';
  bool isLoading = true;
  final logger = Logger();

  List<AlumnoDTO>? _alumnos;
  List<AlumnoDTO>? get getAlumnos => _alumnos;
  AlumnoDTO? _alumnoSeleccionado;
  AlumnoDTO? get getAlumnoSeleccionado => _alumnoSeleccionado;
  String? get getAlumnoSeleccionadoNombreCompleto {
    final nombre =
        '${_alumnoSeleccionado?.nombres} ${_alumnoSeleccionado?.apellidoPaterno} ${_alumnoSeleccionado?.apellidoMaterno}';
    return nombre;
  }

  Future fetchAlumnos() async {
    var url = Uri.parse('http://$urlBase:8080/api/tutores/tutorados');
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('jwt');
    final headersList = {'x-token': token.toString()};
    var respose = await http.get(url, headers: headersList);
    logger.d(respose.statusCode);
    if (respose.statusCode == 200) {
      final json = jsonDecode(respose.body);
      final List<dynamic> data = json['tutorados'];
      _alumnos = data.map((e) => AlumnoDTO.fromJson(e)).toList();
      setAlumnoSeleccionado(AlumnoDTO: _alumnos?[0]);
    } else {
      _alumnos = [];
    }
    isLoading = false;
    notifyListeners();
  }

  void setAlumnoSeleccionado({AlumnoDTO}) => {
        _alumnoSeleccionado = AlumnoDTO,
        notifyListeners(),
        logger.d(_alumnoSeleccionado?.nombres)
      };
}

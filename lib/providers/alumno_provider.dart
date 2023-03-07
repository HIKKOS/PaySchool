import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../DTOs/alumno_DTO.dart';
import '../DTOs/servicios_contratados_dto.dart';
import '../data/Config.dart';

class AlumnoProvider extends ChangeNotifier {
  final urlBase = UrlValue.baseUrl;
  bool isLoading = true;
  bool isLoadingServices = true;
  final logger = Logger();

  List<AlumnoDTO>? _alumnos;
  List<AlumnoDTO>? get getAlumnos => _alumnos;
  List<ServiciosContratadosDTO>? _serviciosContratados;
  List<ServiciosContratadosDTO>? get getServiciosContratados =>
      _serviciosContratados;
  AlumnoDTO? _alumnoSeleccionado;
  AlumnoDTO? get getAlumnoSeleccionado => _alumnoSeleccionado;
  String? get getAlumnoSeleccionadoNombreCompleto {
    final nombre =
        '${_alumnoSeleccionado?.primerNombre} ${_alumnoSeleccionado?.segundoNombre}';
    return nombre;
  }

  Future fetchAlumnos() async {
    var url = Uri.parse('$urlBase/tutores/tutorados');
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('jwt');
    final headersList = {'x-token': token.toString()};
    var respose = await http.get(url, headers: headersList);
    if (respose.statusCode == 200) {
      final json = jsonDecode(respose.body);
      final List<dynamic> data = json['tutorados'];
      _alumnos = data.map((e) => AlumnoDTO.fromJson(e)).toList();
    } else {
      _alumnos = [];
    }
    isLoading = false;
    notifyListeners();
  }

  Future fetchServiciosAlumno() async {
    isLoadingServices = true;
    final alumnoId = _alumnoSeleccionado?.id ?? '';
    var url = Uri.parse('$urlBase/alumnos/servicios/$alumnoId');
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('jwt');
    final headersList = {'x-token': token.toString()};
    var respose = await http.get(url, headers: headersList);
    if (respose.statusCode == 200) {
      final json = jsonDecode(respose.body);
      final List<dynamic> data = json['servicios'];
      _serviciosContratados =
          data.map((e) => ServiciosContratadosDTO.fromJson(e)).toList();

      logger.d(_serviciosContratados);
    } else {
      _serviciosContratados = [];
    }
    isLoadingServices = false;
    notifyListeners();
  }

  void setAlumnoSeleccionado({AlumnoDTO}) => {
        _alumnoSeleccionado = AlumnoDTO,
        fetchServiciosAlumno(),
        notifyListeners(),
      };
}

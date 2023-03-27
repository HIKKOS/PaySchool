import 'dart:convert';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:payschool/domain/repositories/response/contrato.dart';
import 'package:payschool/domain/repositories/response/service_response.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:payschool/pages/service_section.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../domain/repositories/response/services_response_dto.dart';
import '../../../pages/global/app_colors.dart';
import '../Config.dart';

class ServicesProvider extends ChangeNotifier {
  final logger = Logger();
  String baseUrl = UrlValue.baseUrl;

  String _searchValue = '';
  bool _isSearching = false;
  bool isLoading = true;

  var _services;

  var _servicios = [];

  bool get isSearching => _isSearching;

  String? _urlImage;

  ServiceResponseDto? _service;

  List<HorarioServicio> _horarios = [];

  void setSearchValue(String value) {
    _isSearching = true;
    _searchValue = value;
    searchServices(value);
    notifyListeners();
  }

  void setStateFalse() {
    _isSearching = false;
    notifyListeners();
  }

  void setStateTrue() {
    _isSearching = true;
    notifyListeners();
  }

  void filter(BuildContext context) {
    showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(
        MediaQuery.of(context).size.width - 60,
        AppBar().preferredSize.height + 30,
        0,
        0,
      ),
      items: [
        PopupMenuItem<String>(
          value: 'alfabeto',
          child: Row(
            children: const <Widget>[
              Icon(Icons.sort_by_alpha, color: AppColors.greyDark),
              SizedBox(width: 10),
              Text('Alfabeto'),
            ],
          ),
        ),
        const PopupMenuDivider(),
        PopupMenuItem<String>(
          value: 'precio',
          child: Row(
            children: const <Widget>[
              Icon(Icons.attach_money, color: AppColors.greyDark),
              SizedBox(width: 10),
              Text('Precio'),
            ],
          ),
        ),
      ],
    ).then((value) {
      var filteredServices = [];
      if (value == 'alfabeto') {
        filteredServices = List.from(_servicios)
          ..sort((a, b) => a.nombre.compareTo(b.nombre));
        _servicios = filteredServices;
      } else if (value == 'precio') {
        filteredServices = List.from(_servicios)
          ..sort((a, b) => a.costo.compareTo(b.costo));
        _servicios = filteredServices;
      }
      notifyListeners();
    });
  }

  get services => _services;
  ServiceResponseDto? get service => _service;
  get servicios => _servicios;
  List<dynamic> get horarios => _horarios;

  Future renovarServicio(String idServicio, String? idAlumno) async {
    var contrato = {
      'VecesContratado': 1,
    };
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('jwt');
    final url = Uri.parse('$baseUrl/renovar/$idServicio/$idAlumno');

    try {
      final res = await http.post(url, body: jsonEncode(contrato), headers: {
        "Content-Type": "application/json",
        'x-token': token.toString()
      });

      if (res.statusCode == 200) {
        // Parsear la respuesta JSON
        Map<String, dynamic> data = json.decode(res.body);
        // Obtener el enlace de pago
        String linkDePago = data['aprove'];
        logger.d('Servicio recibido: $linkDePago');
        // Abrir el enlace en el navegador web predeterminado
        await launchUrl(
          Uri.parse(linkDePago),
          mode: LaunchMode.externalApplication,
        );
        logger.d(res.body);
        isLoading = false;
        notifyListeners();
      } else {
          throw Exception('No se pudo renovar el servicio');
        }
    } catch (e) {
      throw Exception('Ha ocurrido un error al realizar la petición HTTP: $e');
    }
  }

  Future contratarServicio(String idServicio, String idAlumno,
      int vecesContrato, var horarios) async {
    var horariosDto = horarios
        .map((h) => Horario(
              dia: h.dia,
              inicio: h.inicio,
              fin: h.fin,
            ))
        .toList();

    var contrato = ContratoDto(
      vecesContratado: vecesContrato,
      horario: horariosDto,
    );

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('jwt');
    final url = Uri.parse('$baseUrl/contratar/$idServicio/$idAlumno');

    try {
      final res = await http.post(url, body: jsonEncode(contrato), headers: {
        "Content-Type": "application/json",
        'x-token': token.toString()
      });

      if (res.statusCode == 200) {
        // Parsear la respuesta JSON
        Map<String, dynamic> data = json.decode(res.body);

        // Obtener el enlace de pago
        String linkDePago = data['aprove'];
        logger.d('Servicios recibidos: $linkDePago');
        // Abrir el enlace en el navegador web predeterminado
        await launchUrl(
          Uri.parse(linkDePago),
          mode: LaunchMode.externalApplication,
        );
        logger.d(res.body);
        isLoading = false;
        notifyListeners();
      } else {
        if (res.statusCode == 400) {
          ScaffoldMessenger.of(myGlobals.scaffoldKey.currentContext!)
              .showSnackBar(
            const SnackBar(
              content: Text('Ya ha contratado este servicio'),
              elevation: 10,
              duration: Duration(seconds: 2),
              behavior: SnackBarBehavior.floating,
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
              backgroundColor: Color.fromARGB(200, 0, 0, 0),
            ),
          );
        } else {
          throw Exception('No se pudo contratar el servicio');
        }
      }
    } catch (e) {
      throw Exception('Ha ocurrido un error al realizar la petición HTTP: $e');
    }
  }

  Future fetchServices(int limit, int page) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('jwt');
    final url =
        Uri.parse('$baseUrl/servicios?dataForm=mobil&limit=$limit&page=$page');

    final response = await http.get(
      url,
      headers: {'x-token': token.toString()},
    );
    if (page == 1) {
      _servicios = [];
    }

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final List<dynamic> data = json['Servicios'];

      _services = data.map((e) => ServicesResponseDto.fromJson(e)).toList();
      _servicios.addAll(_services);

      isLoading = false;
      logger.d('Servicios recibidos: $data');
      notifyListeners();
    } else {
      throw Exception('Failed to load services');
    }
  }

  Future searchServices(String servicio) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('jwt');
    final url = Uri.parse('$baseUrl/buscar/Servicios?Servicio=$servicio');

    final response = await http.get(
      url,
      headers: {'x-token': token.toString()},
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      isLoading = false;
      logger.d('Busqueda recibida: $data');

      _services = data.map((e) => ServicesResponseDto.fromJson(e)).toList();
      notifyListeners();
    } else {
      throw Exception('Failed to load services');
    }
  }

  Future getServicesById(String idServicio) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('jwt');
    final url = Uri.parse('$baseUrl/servicios/GetById/$idServicio');

    final response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
        'x-token': token.toString()
      },
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final data = json;
      final List<dynamic> dataHorario = json['HorarioServicio'];
      _service = ServiceResponseDto.fromJson(json);
      _horarios = dataHorario.map((e) => HorarioServicio.fromJson(e)).toList();
      isLoading = false;
      logger.d('Servicio recibido: $data');
      notifyListeners();
    } else {
      throw Exception('Failed to load services');
    }
  }

  String? get urlImage => _urlImage;

  getImagen(String idServicio, String idImagen) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('jwt');
    final url = Uri.parse('$baseUrl/uploads/$idServicio/$idImagen');
    final response =
        await http.get(url, headers: {'x-token': token.toString()});

    if (response.statusCode == 200) {
      _urlImage = '$baseUrl/uploads/$idServicio/$idImagen';
      isLoading = false;
      logger.d('Imagen recibida: $urlImage');
      notifyListeners();
      return urlImage;
    } else {
      throw Exception('Failed to load image: ${response.statusCode}');
    }
  }
}

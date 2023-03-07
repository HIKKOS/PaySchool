import 'dart:convert';
import 'dart:core';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:payschool/domain/repositories/response/service_response.dart';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../domain/repositories/response/services_response_dto.dart';
import '../../../pages/global/app_colors.dart';
import '../Config.dart';

class ServicesProvider extends ChangeNotifier {
  final logger = Logger();
  String baseUrl = UrlValue.baseUrl;

  String _searchValue = '';
  bool _isSearching = false;
  bool isLoading = true;
  List<dynamic>? _services;

  bool get isSearching => _isSearching;

  String? _urlImage;

  ServiceResponseDto? _service;

  void setSearchValue(String value) {
    _searchValue = value;
    searchServices(value);
    notifyListeners();
  }

  void setStateFalse() {
    _isSearching = false;
    _searchValue = '';
    fetchServices('5', '1');
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
      if (value == 'alfabeto') {
        _services?.sort((a, b) => a.nombre.compareTo(b.nombre));
      } else if (value == 'precio') {
        _services?.sort((a, b) => a.costo.compareTo(b.costo));
      }
      notifyListeners();
    });
  }

  List<dynamic>? get services => _services;
  ServiceResponseDto? get service => _service;

  Future fetchServices(String limit, String page) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('jwt');
    final url = Uri.parse('${baseUrl}/servicios?&limit=${limit}&page=${page}');

    final response = await http.get(
      url,
      headers: {'x-token': token.toString()},
    );
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final List<dynamic> data = json['Servicios'];
      _services = data.map((e) => ServicesResponseDto.fromJson(e)).toList();
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
      headers: {'x-token': token.toString()},
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final data = json;

      _service = ServiceResponseDto.fromJson(json);

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

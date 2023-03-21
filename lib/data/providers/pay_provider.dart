import 'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:payschool/data/repositories/app_colors.dart';
import 'package:payschool/domain/repositories/response/pago.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../domain/repositories/response/services_response_dto.dart';
import '../Config.dart';

class PagoProvider extends ChangeNotifier {
  final logger = Logger();
  String baseUrl = UrlValue.baseUrl;

  bool isLoading = true;

  String _searchValue = '';
  bool _isSearching = false;

   bool invertir = false;
   String? _urlImage;

  var _pays;

  var _pagos = [];

  bool get isSearching => _isSearching;

  get pays => _pays;
  get pagos => _pagos;

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
          value: 'inverso',
          child: Row(
            children: const <Widget>[
              Icon(Icons.sort_by_alpha, color: AppColors.greyDark),
              SizedBox(width: 10),
              Text('Inverso'),
            ],
          ),
        ),
        const PopupMenuDivider(),
        PopupMenuItem<String>(
          value: 'normal',
          child: Row(
            children: const <Widget>[
              Icon(Icons.attach_money, color: AppColors.greyDark),
              SizedBox(width: 10),
              Text('Normal'),
            ],
          ),
        ),
      ],
    ).then((value) {
      var filteredServices = [];
      if (value == 'inverso') {
         invertir = true;
      } else if (value == 'normal') {
        invertir = false;
      }
      notifyListeners();
    });
  }

  Future fetchPagos(int limit, int page) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('jwt');
    final url = Uri.parse('${baseUrl}/tutores/pagos/?page=$page&limit=$limit');

    final response = await http.get(
      url,
      headers: {'x-token': token.toString()},
    );
    if (page == 1) {
      _pagos = [];
    }

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final List<dynamic> data = json['pagos'];

      _pays = data.map((e) => PayResponseDto.fromJson(e)).toList();
      _pagos.addAll(_pays);
      isLoading = false;
      logger.d('Pagos recibidos: $data');
      notifyListeners();
    } else {
      throw Exception('Failed to load services');
    }
  }

  Future searchServices(String servicio) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('jwt');
    final url = Uri.parse('$baseUrl/buscar/Pagos?Servicio=$servicio');

    final response = await http.get(
      url,
      headers: {'x-token': token.toString()},
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      isLoading = false;
      logger.d('Busqueda de pago recibida: $data');
      _pays = data.map((e) => PayResponseDto.fromJson(e)).toList();
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

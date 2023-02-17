import 'package:flutter/material.dart';
import 'package:hola_mundo/screens/ScreensMetodoPago/cambio_metodo_pago.dart';
import 'package:hola_mundo/screens/ScreensCambioPassword/cambio_password.dart';
import 'package:hola_mundo/screens/ScreensCambioNumeroT/cambio_telefono.dart';

import '../screens/ScreensCambioCorreo/cambio_correo_page.dart';

class Options {
  String imageUrl;
  String title;
  String description;
  Widget page;

  Options(
      {required this.imageUrl,
      required this.title,
      required this.description,
      required this.page});
}

List<Options> optionsList = [
  Options(
      imageUrl: 'assets/Icons/correo.svg',
      title: 'Correo Electrónico',
      description: 'HIKKOS220@gmail.com',
      page: const CambioCorreoPage()),
  Options(
      imageUrl: 'assets/Icons/telefono.svg',
      title: 'Numero de telefono ',
      description: '(999) 123 4567',
      page:  const CambioTelefonoPage() ),
  Options(
      imageUrl: 'assets/Icons/PagoM.svg',
      title: 'Métodos de Pago ',
      description: '1 metodo de Pago',
      page: const CambioMetodoPage()),
  Options(
      imageUrl: 'assets/Icons/Contraseña.svg',
      title: 'Cambio Contraseña ',
      description: '',
      page: const CambioPasswordPage()),
];

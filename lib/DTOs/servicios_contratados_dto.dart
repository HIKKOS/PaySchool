// To parse this JSON data, do
//
//     final serviciosContratadosDto = serviciosContratadosDtoFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ServiciosContratadosDTO serviciosContratadosDtoFromJson(String str) =>
    ServiciosContratadosDTO.fromJson(json.decode(str));

String serviciosContratadosDtoToJson(ServiciosContratadosDTO data) =>
    json.encode(data.toJson());

class ServiciosContratadosDTO {
  ServiciosContratadosDTO({
    required this.id,
    required this.nombre,
    required this.costo,
    required this.expirado,
    required this.fechaExpiracion,
    required this.diasRestantes,
  });

  final String id;
  final String nombre;
  final double costo;
  final bool expirado;
  final DateTime fechaExpiracion;
  final int diasRestantes;

  factory ServiciosContratadosDTO.fromJson(Map<String, dynamic> json) =>
      ServiciosContratadosDTO(
        id: json["Id"],
        nombre: json["Nombre"],
        costo: json["Costo"]?.toDouble(),
        expirado: json["Expirado"],
        fechaExpiracion: DateTime.parse(json["FechaExpiracion"]),
        diasRestantes: json["DiasRestantes"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Nombre": nombre,
        "Costo": costo,
        "Expirado": expirado,
        "FechaExpiracion": fechaExpiracion.toIso8601String(),
        "DiasRestantes": diasRestantes,
      };
}

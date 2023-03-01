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
    required this.diasRestantes,
  });

  final String id;
  final String nombre;
  final dynamic costo;
  final int diasRestantes;

  factory ServiciosContratadosDTO.fromJson(Map<String, dynamic> json) =>
      ServiciosContratadosDTO(
        id: json["Id"],
        nombre: json["Nombre"],
        costo: json["Costo"],
        diasRestantes: json["diasRestantes"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Nombre": nombre,
        "Costo": costo,
        "diasRestantes": diasRestantes,
      };
}

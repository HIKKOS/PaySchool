// To parse this JSON data, do
//
//     final alumnoDto = alumnoDtoFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

AlumnoDTO alumnoDtoFromJson(String str) => AlumnoDTO.fromJson(json.decode(str));

String alumnoDtoToJson(AlumnoDTO data) => json.encode(data.toJson());

class AlumnoDTO {
  AlumnoDTO({
    required this.id,
    required this.primerNombre,
    required this.segundoNombre,
    required this.apellidoMaterno,
    required this.apellidoPaterno,
    required this.grado,
    required this.grupo,
    required this.genero,
  });

  final String id;
  final String primerNombre;
  final String segundoNombre;
  final String apellidoMaterno;
  final String apellidoPaterno;
  final int grado;
  final String grupo;
  final int genero;

  factory AlumnoDTO.fromJson(Map<String, dynamic> json) => AlumnoDTO(
        id: json["Id"],
        primerNombre: json["PrimerNombre"],
        segundoNombre: json["SegundoNombre"],
        apellidoMaterno: json["ApellidoMaterno"],
        apellidoPaterno: json["ApellidoPaterno"],
        grado: json["Grado"],
        grupo: json["Grupo"],
        genero: json["Genero"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "PrimerNombre": primerNombre,
        "SegundoNombre": segundoNombre,
        "ApellidoMaterno": apellidoMaterno,
        "ApellidoPaterno": apellidoPaterno,
        "Grado": grado,
        "Grupo": grupo,
        "Genero": genero,
      };
}

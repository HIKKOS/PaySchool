// To parse this JSON data, do
//
//     final tutor = tutorFromJson(jsonString);

import 'dart:convert';

Tutor tutorFromJson(String str) => Tutor.fromJson(json.decode(str));

String tutorToJson(Tutor data) => json.encode(data.toJson());

class Tutor {
  Tutor({
    required this.id,
    required this.primerNombre,
    required this.segundoNombre,
    required this.apellidoMaterno,
    required this.apellidoPaterno,
    required this.foto,
    required this.correo,
    required this.telefono,
    required this.rfc,
    required this.direccion,
  });

  final String id;
  final String primerNombre;
  final String segundoNombre;
  final String apellidoMaterno;
  final String apellidoPaterno;
  final String foto;
  late final String correo;
  final String telefono;
  final String rfc;
  final String direccion;

  factory Tutor.fromJson(Map<String, dynamic> json) => Tutor(
        id: json["Id"],
        primerNombre: json["PrimerNombre"],
        segundoNombre: json["SegundoNombre"],
        apellidoMaterno: json["ApellidoMaterno"],
        apellidoPaterno: json["ApellidoPaterno"],
        foto: json["Foto"],
        correo: json["Correo"],
        telefono: json["Telefono"],
        rfc: json["RFC"],
        direccion: json["Direccion"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "PrimerNombre": primerNombre,
        "SegundoNombre": segundoNombre,
        "ApellidoMaterno": apellidoMaterno,
        "ApellidoPaterno": apellidoPaterno,
        "Foto": foto,
        "Correo": correo,
        "Telefono": telefono,
        "RFC": rfc,
        "Direccion": direccion,
      };
}

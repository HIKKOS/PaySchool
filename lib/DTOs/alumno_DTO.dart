import 'dart:convert';

AlumnoDTO alumnoFromJson(String str) => AlumnoDTO.fromJson(json.decode(str));

String alumnoToJson(AlumnoDTO data) => json.encode(data.toJson());

class AlumnoDTO {
  AlumnoDTO({
    required this.id,
    required this.nombres,
    required this.apellidoMaterno,
    required this.apellidoPaterno,
    required this.grado,
    required this.grupo,
    required this.genero,
  });

  final String id;
  final String nombres;
  final String apellidoMaterno;
  final String apellidoPaterno;
  final int grado;
  final String grupo;
  final int genero;

  factory AlumnoDTO.fromJson(Map<String, dynamic> json) => AlumnoDTO(
        id: json["Id"],
        nombres: json["Nombres"],
        apellidoMaterno: json["ApellidoMaterno"],
        apellidoPaterno: json["ApellidoPaterno"],
        grado: json["Grado"],
        grupo: json["Grupo"],
        genero: json["Genero"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Nombres": nombres,
        "ApellidoMaterno": apellidoMaterno,
        "ApellidoPaterno": apellidoPaterno,
        "Grado": grado,
        "Grupo": grupo,
        "Genero": genero,
      };
}

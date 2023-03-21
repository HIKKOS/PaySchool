// To parse this JSON data, do
//
//     final contratoDto = contratoDtoFromJson(jsonString);

import 'dart:convert';

ContratoDto contratoDtoFromJson(String str) => ContratoDto.fromJson(json.decode(str));

String contratoDtoToJson(ContratoDto data) => json.encode(data.toJson());

class ContratoDto {
    ContratoDto({
        required this.vecesContratado,
        required this.horario,
    });

    final int vecesContratado;
    final List<dynamic> horario;

    factory ContratoDto.fromJson(Map<String, dynamic> json) => ContratoDto(
        vecesContratado: json["VecesContratado"],
        horario: List<Horario>.from(json["Horario"].map((x) => Horario.fromJson(x))),
    );

    factory ContratoDto.fromMap(Map<String, dynamic> json) => ContratoDto(
        vecesContratado: json["VecesContratado"],
        horario: List<Horario>.from(json["Horario"].map((x) => Horario.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "VecesContratado": vecesContratado,
        "Horario": List<dynamic>.from(horario.map((x) => x.toJson())),
    };
}

class Horario {
    Horario({
        required this.dia,
        required this.inicio,
        required this.fin,
    });

    final String dia;
    final int inicio;
    final int fin;

    factory Horario.fromJson(Map<String, dynamic> json) => Horario(
        dia: json["Dia"],
        inicio: json["Inicio"],
        fin: json["Fin"],
    );

    factory Horario.fromMap(Map<String, dynamic> json) => Horario(
        dia: json["Dia"],
        inicio: json["Inicio"],
        fin: json["Fin"],
    );

    Map<String, dynamic> toJson() => {
        "Dia": dia,
        "Inicio": inicio,
        "Fin": fin,
    };
}

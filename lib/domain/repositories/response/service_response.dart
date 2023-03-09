// To parse this JSON data, do
//
//     final serviceResponseDto = serviceResponseDtoFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ServiceResponseDto serviceResponseDtoFromJson(String str) =>
    ServiceResponseDto.fromJson(json.decode(str));

String serviceResponseDtoToJson(ServiceResponseDto data) =>
    json.encode(data.toJson());

class ServiceResponseDto {
  ServiceResponseDto({
    required this.id,
    required this.nombre,
    required this.cancelable,
    required this.descripcion,
    required this.costo,
    required this.frecuenciaDePago,
    required this.horarioServicio,
    required this.imgPaths,
  });

  final String id;
  final String nombre;
  final bool cancelable;
  final String descripcion;
  final double costo;
  final String frecuenciaDePago;
  final List<HorarioServicio> horarioServicio;
  final List<String> imgPaths;

  factory ServiceResponseDto.fromMap(Map<String, dynamic> json) =>
      ServiceResponseDto(
        id: json["Id"],
        nombre: json["Nombre"],
        cancelable: json["Cancelable"],
        descripcion: json["Descripcion"],
        costo: json["Costo"]?.toDouble(),
        frecuenciaDePago: json["FrecuenciaDePago"],
        horarioServicio: List<HorarioServicio>.from(
            json["HorarioServicio"].map((x) => HorarioServicio.fromJson(x))),
        imgPaths: List<String>.from(json["ImgPaths"].map((x) => x)),
      );

  factory ServiceResponseDto.fromJson(Map<String, dynamic> json) =>
      ServiceResponseDto(
        id: json["Id"],
        nombre: json["Nombre"],
        cancelable: json["Cancelable"],
        descripcion: json["Descripcion"],
        costo: json["Costo"]?.toDouble(),
        frecuenciaDePago: json["FrecuenciaDePago"],
        horarioServicio: List<HorarioServicio>.from(
            json["HorarioServicio"].map((x) => HorarioServicio.fromJson(x))),
        imgPaths: List<String>.from(json["ImgPaths"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Nombre": nombre,
        "Cancelable": cancelable,
        "Descripcion": descripcion,
        "Costo": costo,
        "FrecuenciaDePago": frecuenciaDePago,
        "HorarioServicio":
            List<dynamic>.from(horarioServicio.map((x) => x.toJson())),
        "ImgPaths": List<dynamic>.from(imgPaths.map((x) => x)),
      };
}

class HorarioServicio {
  HorarioServicio({
    required this.id,
    required this.servicioId,
    required this.dia,
    required this.horaInicio,
    required this.horaFin,
  });

  final String id;
  final String servicioId;
  final String dia;
  final int horaInicio;
  final int horaFin;

  factory HorarioServicio.fromMap(Map<String, dynamic> json) => HorarioServicio(
        id: json["Id"],
        servicioId: json["ServicioId"],
        dia: json["Dia"],
        horaInicio: json["HoraInicio"],
        horaFin: json["HoraFin"],
      );

  factory HorarioServicio.fromJson(Map<String, dynamic> json) =>
      HorarioServicio(
        id: json["Id"],
        servicioId: json["ServicioId"],
        dia: json["Dia"],
        horaInicio: json["HoraInicio"],
        horaFin: json["HoraFin"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "ServicioId": servicioId,
        "Dia": dia,
        "HoraInicio": horaInicio,
        "HoraFin": horaFin,
      };

  Map<String, dynamic> toMap() {
    return {
      "Dia": dia,
      "Inicio": horaInicio,
      "Fin": horaFin,
    };
  }

  List<Map<String, dynamic>> horariosToMap(List<HorarioServicio> horarios) {
    return horarios.map((horario) => horario.toMap()).toList();
  }
}

// To parse this JSON data, do
//
//     final serviceResponseDto = serviceResponseDtoFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ServiceResponseDto serviceResponseDtoFromJson(String str) => ServiceResponseDto.fromJson(json.decode(str));

String serviceResponseDtoToJson(ServiceResponseDto data) => json.encode(data.toJson());

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
    final List<dynamic> horarioServicio;
    final List<String> imgPaths;

    factory ServiceResponseDto.fromMap(Map<String, dynamic> json) => ServiceResponseDto(
        id: json["Id"],
        nombre: json["Nombre"],
        cancelable: json["Cancelable"],
        descripcion: json["Descripcion"],
        costo: json["Costo"]?.toDouble(),
        frecuenciaDePago: json["FrecuenciaDePago"],
        horarioServicio: List<dynamic>.from(json["HorarioServicio"].map((x) => x)),
        imgPaths: List<String>.from(json["ImgPaths"].map((x) => x)),
    );

    factory ServiceResponseDto.fromJson(Map<String, dynamic> json) => ServiceResponseDto(
        id: json["Id"],
        nombre: json["Nombre"],
        cancelable: json["Cancelable"],
        descripcion: json["Descripcion"],
        costo: json["Costo"]?.toDouble(),
        frecuenciaDePago: json["FrecuenciaDePago"],
        horarioServicio: List<dynamic>.from(json["HorarioServicio"].map((x) => x)),
        imgPaths: List<String>.from(json["ImgPaths"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "Id": id,
        "Nombre": nombre,
        "Cancelable": cancelable,
        "Descripcion": descripcion,
        "Costo": costo,
        "FrecuenciaDePago": frecuenciaDePago,
        "HorarioServicio": List<dynamic>.from(horarioServicio.map((x) => x)),
        "ImgPaths": List<dynamic>.from(imgPaths.map((x) => x)),
    };
}

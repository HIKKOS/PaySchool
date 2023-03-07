import 'package:meta/meta.dart';
import 'dart:convert';

ServicesResponseDto serviceResponseDtoFromJson(String str) => ServicesResponseDto.fromJson(json.decode(str));

String serviceResponseDtoToJson(ServicesResponseDto data) => json.encode(data.toJson());

class ServicesResponseDto {
  ServicesResponseDto({
    required this.id,
    required this.nombre,
    required this.costo,
    required this.ImgPaths,
  });

  final String id;
  final String nombre;
  final double costo;
  final List<dynamic> ImgPaths;

    factory ServicesResponseDto.fromMap(Map<String, dynamic> json) => ServicesResponseDto(
        id: json["Id"],
        nombre: json["Nombre"],
        costo: json["Costo"],
        ImgPaths: List<dynamic>.from(json["ImgPaths"].map((x) => x)),
      );

    factory ServicesResponseDto.fromJson(Map<String, dynamic> json) => ServicesResponseDto(
        id: json["Id"],
        nombre: json["Nombre"],
        costo: json["Costo"],
        ImgPaths: List<dynamic>.from(json["ImgPaths"].map((x) => x)),
    );

  
    Map<String, dynamic> toJson() => {
        "Id": id,
        "Nombre": nombre,
        "Costo": costo,
        "ImgPaths": List<dynamic>.from(ImgPaths.map((x) => x)),
    };
}
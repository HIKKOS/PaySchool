// To parse this JSON data, do
//
//     final serviceResponseDto = serviceResponseDtoFromJson(jsonString);
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
        costo: json["Costo"].toDouble(),
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
        costo: json["Costo"].toDouble(),
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
    required this.inicio,
    required this.fin,
  });

  final String id;
  final String servicioId;
  final String dia;
  final int inicio;
  final int fin;

  factory HorarioServicio.fromMap(Map<String, dynamic> json) => HorarioServicio(
        id: json["Id"],
        servicioId: json["ServicioId"],
        dia: json["Dia"],
        inicio: json["Inicio"],
        fin: json["Fin"],
      );

  factory HorarioServicio.fromJson(Map<String, dynamic> json) =>
      HorarioServicio(
        id: json["Id"],
        servicioId: json["ServicioId"],
        dia: json["Dia"],
        inicio: json["Inicio"],
        fin: json["Fin"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "ServicioId": servicioId,
        "Dia": dia,
        "Inicio":inicio,
        "Fin": fin,
      };

  Map<String, dynamic> toMap() {
    return {
      "Dia": dia,
      "Inicio": inicio,
      "Fin": fin,
    };
  }

  List<Map<String, dynamic>> horariosToMap(List<HorarioServicio> horarios) {
    return horarios.map((horario) => horario.toMap()).toList();
  }
}

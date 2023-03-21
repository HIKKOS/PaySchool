import 'package:meta/meta.dart';
import 'dart:convert';

List<PayResponseDto> payResponseDtoFromJson(String str) => List<PayResponseDto>.from(json.decode(str).map((x) => PayResponseDto.fromJson(x)));

String payResponseDtoToJson(List<PayResponseDto> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PayResponseDto {
    PayResponseDto({
        required this.folio,
        required this.fechaPago,
        required this.servicio,
        required this.servicioId,
        required this.monto,
        required this.facturado,
        required this.alumno,
        required this.year,
        required this.month,
        required this.imgPaths,
    });

    final int folio;
    final DateTime fechaPago;
    final String servicio;
    final String servicioId;
    final double monto;
    final bool facturado;
    final String alumno;
    final int year; // Año
    final int month; // Mes
    final List<String> imgPaths;

    factory PayResponseDto.fromMap(Map<String, dynamic> json) => PayResponseDto(
        folio: json["folio"],
        fechaPago: DateTime.parse(json["fechaPago"]),
        servicio: json["servicio"],
        servicioId: json["servicioId"],
        monto: json["monto"]?.toDouble(),
        facturado: json["facturado"],
        alumno: json["alumno"],
        year: DateTime.parse(json["fechaPago"]).year,
        month: DateTime.parse(json["fechaPago"]).month,
        imgPaths: List<String>.from(json["imgPaths"].map((x) => x))
    );

    factory PayResponseDto.fromJson(Map<String, dynamic> json) => PayResponseDto(
        folio: json["folio"],
        fechaPago: DateTime.parse(json["fechaPago"]),
        servicio: json["servicio"],
        servicioId: json["servicioId"],
        monto: json["monto"]?.toDouble(),
        facturado: json["facturado"],
        alumno: json["alumno"],
        year: DateTime.parse(json["fechaPago"]).year,
        month: DateTime.parse(json["fechaPago"]).month,
        imgPaths: List<String>.from(json["imgPaths"].map((x) => x))
    );

    Map<String, dynamic> toJson() => {
        "folio": folio,
        "fechaPago": fechaPago.toIso8601String(),
        "servicio": servicio,
        "servicioId": servicioId,
        "monto": monto,
        "facturado": facturado,
        "alumno": alumno,
        "year": year,
        "month": month,
        "imgPaths": List<dynamic>.from(imgPaths.map((x) => x))
    };
}

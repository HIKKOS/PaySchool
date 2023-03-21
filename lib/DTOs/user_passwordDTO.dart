// To parse this JSON data, do
//
//     final userPasswordDto = userPasswordDtoFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

UserPasswordDto userPasswordDtoFromJson(String str) => UserPasswordDto.fromJson(json.decode(str));

String userPasswordDtoToJson(UserPasswordDto data) => json.encode(data.toJson());

class UserPasswordDto {
    UserPasswordDto({
        required this.passwordActual,
        required this.nuevaPassword,
    });

    final String passwordActual;
    final String nuevaPassword;

    factory UserPasswordDto.fromJson(Map<String, dynamic> json) => UserPasswordDto(
        passwordActual: json["passwordActual"],
        nuevaPassword: json["nuevaPassword"],
    );

    Map<String, dynamic> toJson() => {
        "passwordActual": passwordActual,
        "nuevaPassword": nuevaPassword,
    };
}


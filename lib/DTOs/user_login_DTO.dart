import 'dart:convert';

UserLoginDto userLoginDtoFromJson(String str) =>
    UserLoginDto.fromJson(json.decode(str));

String userLoginDtoToJson(UserLoginDto data) => json.encode(data.toJson());

class UserLoginDto {
  UserLoginDto({
    required this.correo,
    required this.password,
  });

  final String correo;
  final String password;

  factory UserLoginDto.fromJson(Map<String, dynamic> json) => UserLoginDto(
        correo: json["Correo"],
        password: json["Password"],
      );

  Map<String, dynamic> toJson() => {
        "Correo": correo,
        "Password": password,
      };
}

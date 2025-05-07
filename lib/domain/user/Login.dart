// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));
String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  String usuario;
  String password;

  Login({
    required this.usuario,
    required this.password,
  });

  factory Login.fromJson(Map<String, dynamic> json) => Login(
    usuario: json["usuario"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "usuario": usuario,
    "password": password,
  };
}

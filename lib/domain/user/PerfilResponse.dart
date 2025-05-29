// To parse this JSON data, do
//
//     final perfilResponse = perfilResponseFromJson(jsonString);

import 'dart:convert';

import 'User.dart';

PerfilResponse perfilResponseFromJson(String str) => PerfilResponse.fromJson(json.decode(str));

String perfilResponseToJson(PerfilResponse data) => json.encode(data.toJson());

class PerfilResponse {
  bool success;
  String? mensaje;
  Usuario? usuario;

  PerfilResponse({
    required this.success,
    this.mensaje,
    this.usuario,
  });

  factory PerfilResponse.fromJson(Map<String, dynamic> json) => PerfilResponse(
    success: json["success"],
    mensaje: json["mensaje"],
    usuario: json["usuario"] == null ? null : Usuario.fromJson(json["usuario"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "mensaje": mensaje,
    "usuario": usuario?.toJson(),
  };
}


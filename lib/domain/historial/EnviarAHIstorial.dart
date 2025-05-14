// To parse this JSON data, do
//
//     final historial = historialFromJson(jsonString);

import 'dart:convert';

Historial historialFromJson(String str) => Historial.fromJson(json.decode(str));

String historialToJson(Historial data) => json.encode(data.toJson());

class Historial {
  int idUsuario;

  Historial({
    required this.idUsuario,
  });

  factory Historial.fromJson(Map<String, dynamic> json) => Historial(
    idUsuario: json["id_usuario"],
  );

  Map<String, dynamic> toJson() => {
    "id_usuario": idUsuario,
  };
}

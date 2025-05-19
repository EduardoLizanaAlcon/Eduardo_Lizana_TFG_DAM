// To parse this JSON data, do
//
//     final siguienteJugadorResponse = siguienteJugadorResponseFromJson(jsonString);

import 'dart:convert';

SiguienteJugadorResponse siguienteJugadorResponseFromJson(String str) => SiguienteJugadorResponse.fromJson(json.decode(str));

String siguienteJugadorResponseToJson(SiguienteJugadorResponse data) => json.encode(data.toJson());

class SiguienteJugadorResponse {
  bool success;
  String? siguienteJugador;

  SiguienteJugadorResponse({
    required this.success,
    this.siguienteJugador,
  });

  factory SiguienteJugadorResponse.fromJson(Map<String, dynamic> json) => SiguienteJugadorResponse(
    success: json["success"],
    siguienteJugador: json["siguiente_jugador"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "siguiente_jugador": siguienteJugador,
  };
}

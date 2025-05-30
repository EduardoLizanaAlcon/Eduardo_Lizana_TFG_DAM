// To parse this JSON data, do
//
//     final comprobarRondaResponse = comprobarRondaResponseFromJson(jsonString);

import 'dart:convert';

ComprobarRondaResponse comprobarRondaResponseFromJson(String str) => ComprobarRondaResponse.fromJson(json.decode(str));

String comprobarRondaResponseToJson(ComprobarRondaResponse data) => json.encode(data.toJson());

class ComprobarRondaResponse {
  bool success;
  int? ganadorJugada;
  int? ganadorSet;
  int? puntosEquipo1;
  int? puntosEquipo2;
  int? ganadorPartida;

  ComprobarRondaResponse({
    required this.success,
    this.ganadorJugada,
    this.ganadorSet,
    this.puntosEquipo1,
    this.puntosEquipo2,
    this.ganadorPartida,
  });

  factory ComprobarRondaResponse.fromJson(Map<String, dynamic> json) => ComprobarRondaResponse(
    success: json["success"],
    ganadorJugada: json["ganador_jugada"],
    ganadorSet: json["ganador_set"],
    puntosEquipo1: json["puntos_equipo1"],
    puntosEquipo2: json["puntos_equipo2"],
    ganadorPartida: json["ganador_partida"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "ganador_jugada": ganadorJugada,
    "ganador_set": ganadorSet,
    "puntos_equipo1": puntosEquipo1,
    "puntos_equipo2": puntosEquipo2,
    "ganador_partida": ganadorPartida,
  };
}

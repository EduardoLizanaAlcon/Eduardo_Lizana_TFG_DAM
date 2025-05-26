// To parse this JSON data, do
//
//     final jugarCarta = jugarCartaFromJson(jsonString);

import 'dart:convert';

JugarCarta jugarCartaFromJson(String str) => JugarCarta.fromJson(json.decode(str));

String jugarCartaToJson(JugarCarta data) => json.encode(data.toJson());

class JugarCarta {
  String? idBaraja;
  int? idJugador;
  String? carta;
  bool? primero;
  bool? arrastre=false;

  JugarCarta({
    this.idBaraja,
    this.idJugador,
    this.carta,
    this.primero,
    this.arrastre,
  });

  factory JugarCarta.fromJson(Map<String, dynamic> json) => JugarCarta(
    idBaraja: json["idBaraja"],
    idJugador: json["idJugador"],
    carta: json["carta"],
    primero: json["primero"],
    arrastre: json["arrastre"],
  );

  Map<String, dynamic> toJson() => {
    "idBaraja": idBaraja,
    "idJugador": idJugador,
    "carta": carta,
    "primero": primero,
    'arrastre': arrastre,
  };
}

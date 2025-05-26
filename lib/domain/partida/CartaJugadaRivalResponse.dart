// To parse this JSON data, do
//
//     final cartaJugadaRivalResponse = cartaJugadaRivalResponseFromJson(jsonString);

import 'dart:convert';

import 'package:tfg_ginyote/domain/partida/Carta.dart';

CartaJugadaRivalResponse cartaJugadaRivalResponseFromJson(String str) => CartaJugadaRivalResponse.fromJson(json.decode(str));

String cartaJugadaRivalResponseToJson(CartaJugadaRivalResponse data) => json.encode(data.toJson());

class CartaJugadaRivalResponse {
  bool success;
  List<Carta>? cartasRival;
  bool? arrastre;

  CartaJugadaRivalResponse({
    required this.success,
    this.cartasRival,
    this.arrastre
  });

  factory CartaJugadaRivalResponse.fromJson(Map<String, dynamic> json) => CartaJugadaRivalResponse(
    success: json["success"],
    arrastre: json["arrastre"],
    cartasRival: json["cartasRival"] == null ? [] : List<Carta>.from(json["cartasRival"]!.map((x) => Carta.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "arrastre": arrastre,
    "cartasRival": cartasRival == null ? [] : List<dynamic>.from(cartasRival!.map((x) => x.toJson())),
  };
}


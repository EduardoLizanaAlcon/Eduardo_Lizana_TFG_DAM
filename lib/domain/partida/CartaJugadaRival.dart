// To parse this JSON data, do
//
//     final cartaJugadaRival = cartaJugadaRivalFromJson(jsonString);

import 'dart:convert';

CartaJugadaRival cartaJugadaRivalFromJson(String str) => CartaJugadaRival.fromJson(json.decode(str));

String cartaJugadaRivalToJson(CartaJugadaRival data) => json.encode(data.toJson());

class CartaJugadaRival {
  String idBaraja;
  String idJugador;

  CartaJugadaRival({
    required this.idBaraja,
    required this.idJugador,
  });

  factory CartaJugadaRival.fromJson(Map<String, dynamic> json) => CartaJugadaRival(
    idBaraja: json["idBaraja"],
    idJugador: json["idJugador"],
  );

  Map<String, dynamic> toJson() => {
    "idBaraja": idBaraja,
    "idJugador": idJugador,
  };
}

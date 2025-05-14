// To parse this JSON data, do
//
//     final verMano = verManoFromJson(jsonString);

import 'dart:convert';

VerMano verManoFromJson(String str) => VerMano.fromJson(json.decode(str));

String verManoToJson(VerMano data) => json.encode(data.toJson());

class VerMano {
  String idBaraja;
  int idJugador;

  VerMano({
    required this.idBaraja,
    required this.idJugador,
  });

  factory VerMano.fromJson(Map<String, dynamic> json) => VerMano(
    idBaraja: json["idBaraja"],
    idJugador: json["idJugador"],
  );

  Map<String, dynamic> toJson() => {
    "idBaraja": idBaraja,
    "idJugador": idJugador,
  };
}

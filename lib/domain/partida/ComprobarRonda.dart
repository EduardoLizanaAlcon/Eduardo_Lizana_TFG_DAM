// To parse this JSON data, do
//
//     final cartaJugadaRival = cartaJugadaRivalFromJson(jsonString);

import 'dart:convert';

ComprobarRonda ComprobarRondaRivalFromJson(String str) => ComprobarRonda.fromJson(json.decode(str));

String ComprobarRondaToJson(ComprobarRonda data) => json.encode(data.toJson());

class ComprobarRonda {
  String idBaraja;
  String idCarta;

  ComprobarRonda({
    required this.idBaraja,
    required this.idCarta,
  });

  factory ComprobarRonda.fromJson(Map<String, dynamic> json) => ComprobarRonda(
    idBaraja: json["id_partida"],
    idCarta: json["id_Carta"],
  );

  Map<String, dynamic> toJson() => {
    "id_partida": idBaraja,
    "id_Carta": idCarta,
  };
}

// To parse this JSON data, do
//
//     final comprobarRonda = comprobarRondaFromJson(jsonString);

import 'dart:convert';

ComprobarRonda comprobarRondaFromJson(String str) => ComprobarRonda.fromJson(json.decode(str));

String comprobarRondaToJson(ComprobarRonda data) => json.encode(data.toJson());

class ComprobarRonda {
  String idBaraja;
  String idCarta;
  int set;

  ComprobarRonda({
    required this.idBaraja,
    required this.idCarta,
    required this.set,
  });

  factory ComprobarRonda.fromJson(Map<String, dynamic> json) => ComprobarRonda(
    idBaraja: json["id_baraja"],
    idCarta: json["id_carta"],
    set: json["set"],
  );

  Map<String, dynamic> toJson() => {
    "id_baraja": idBaraja,
    "id_carta": idCarta,
    "set": set,
  };
}

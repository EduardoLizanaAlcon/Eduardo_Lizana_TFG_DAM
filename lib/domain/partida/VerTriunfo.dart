// To parse this JSON data, do
//
//     final verTriunfo = verTriunfoFromJson(jsonString);

import 'dart:convert';

VerTriunfo verTriunfoFromJson(String str) => VerTriunfo.fromJson(json.decode(str));

String verTriunfoToJson(VerTriunfo data) => json.encode(data.toJson());

class VerTriunfo {
  String idBaraja;
  String idJugador;

  VerTriunfo({
    required this.idBaraja,
    this.idJugador="triunfo",
  });

  factory VerTriunfo.fromJson(Map<String, dynamic> json) => VerTriunfo(
    idBaraja: json["idBaraja"],
    idJugador: json["idJugador"],
  );

  Map<String, dynamic> toJson() => {
    "idBaraja": idBaraja,
    "idJugador": idJugador,
  };
}

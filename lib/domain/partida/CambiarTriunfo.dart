// To parse this JSON data, do
//
//     final cambiarTriunfo = cambiarTriunfoFromJson(jsonString);

import 'dart:convert';

CambiarTriunfo cambiarTriunfoFromJson(String str) => CambiarTriunfo.fromJson(json.decode(str));

String cambiarTriunfoToJson(CambiarTriunfo data) => json.encode(data.toJson());

class CambiarTriunfo {
  int? idUsuario;
  String? idBaraja;
  String? idCarta;

  CambiarTriunfo({
    this.idUsuario,
    this.idBaraja,
    this.idCarta,
  });

  factory CambiarTriunfo.fromJson(Map<String, dynamic> json) => CambiarTriunfo(
    idUsuario: json["id_usuario"],
    idBaraja: json["id_baraja"],
    idCarta: json["id_Carta"],
  );

  Map<String, dynamic> toJson() => {
    "id_usuario": idUsuario,
    "id_baraja": idBaraja,
    "id_Carta": idCarta,
  };
}

// To parse this JSON data, do
//
//     final buscarPartida = buscarPartidaFromJson(jsonString);

import 'dart:convert';

BuscarPartida buscarPartidaFromJson(String str) => BuscarPartida.fromJson(json.decode(str));

String buscarPartidaToJson(BuscarPartida data) => json.encode(data.toJson());

class BuscarPartida {
  int id_usuario;

  BuscarPartida({
    required this.id_usuario,
  });

  factory BuscarPartida.fromJson(Map<String, dynamic> json) => BuscarPartida(
    id_usuario: json["id_usuario"],
  );

  Map<String, dynamic> toJson() => {
    "id_usuario": id_usuario,
  };
}

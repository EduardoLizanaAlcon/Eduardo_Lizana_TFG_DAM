// To parse this JSON data, do
//
//     final buscarpartidaResponse = buscarpartidaResponseFromJson(jsonString);

import 'dart:convert';

BuscarpartidaResponse buscarpartidaResponseFromJson(String str) => BuscarpartidaResponse.fromJson(json.decode(str));

String buscarpartidaResponseToJson(BuscarpartidaResponse data) => json.encode(data.toJson());

class BuscarpartidaResponse {
  bool success;
  String? message;
  String? mensaje;
  int? creador;
  int? seUne;
  bool? partidaCreada;
  InformacionCreada? informacionCreada;

  BuscarpartidaResponse({
    required this.success,
    this.message,
    this.mensaje,
    this.creador,
    this.seUne,
    this.partidaCreada,
    this.informacionCreada,
  });

  factory BuscarpartidaResponse.fromJson(Map<String, dynamic> json) => BuscarpartidaResponse(
    success: json["success"],
    message: json["message"],
    mensaje: json["mensaje"],
    creador: json["creador"],
    seUne: json["seUne"],
    partidaCreada: json["PartidaCreada"],
    informacionCreada: json["InformacionCreada"] == null ? null : InformacionCreada.fromJson(json["InformacionCreada"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "mensaje": mensaje,
    "creador": creador,
    "seUne": seUne,
    "PartidaCreada": partidaCreada,
    "InformacionCreada": informacionCreada?.toJson(),
  };
}

class InformacionCreada {
  bool success;
  String equipo1;
  String equipo2;
  String idBaraja;
  String idPartida;

  InformacionCreada({
    required this.success,
    required this.equipo1,
    required this.equipo2,
    required this.idBaraja,
    required this.idPartida,
  });

  factory InformacionCreada.fromJson(Map<String, dynamic> json) => InformacionCreada(
    success: json["success"],
    equipo1: json["equipo1"],
    equipo2: json["equipo2"],
    idBaraja: json["id_baraja"],
    idPartida: json["id_partida"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "equipo1": equipo1,
    "equipo2": equipo2,
    "id_baraja": idBaraja,
    "id_partida": idPartida,
  };
}

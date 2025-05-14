// To parse this JSON data, do
//
//     final historialResponse = historialResponseFromJson(jsonString);

import 'dart:convert';

HistorialResponse historialResponseFromJson(String str) => HistorialResponse.fromJson(json.decode(str));

String historialResponseToJson(HistorialResponse data) => json.encode(data.toJson());

class HistorialResponse {
  bool success;
  String? mensaje;
  List<Partida> partidas;

  HistorialResponse({
    required this.success,
    required this.mensaje,
    required this.partidas,
  });

  factory HistorialResponse.fromJson(Map<String, dynamic> json) => HistorialResponse(
    success: json["success"],
    mensaje: json["mensaje"],
    partidas: List<Partida>.from(json["partidas"].map((x) => Partida.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "mensaje": mensaje,
    "partidas": List<dynamic>.from(partidas.map((x) => x.toJson())),
  };
}

class Partida {
  String equipo1Nombres;
  String equipo2Nombres;
  String resultado;
  String detalleSets;

  Partida({
    required this.equipo1Nombres,
    required this.equipo2Nombres,
    required this.resultado,
    required this.detalleSets,
  });

  factory Partida.fromJson(Map<String, dynamic> json) => Partida(
    equipo1Nombres: json["equipo1_nombres"],
    equipo2Nombres: json["equipo2_nombres"],
    resultado: json["resultado"],
    detalleSets: json["detalle_sets"],
  );

  Map<String, dynamic> toJson() => {
    "equipo1_nombres": equipo1Nombres,
    "equipo2_nombres": equipo2Nombres,
    "resultado": resultado,
    "detalle_sets": detalleSets,
  };
}

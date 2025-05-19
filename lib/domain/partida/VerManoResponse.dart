// To parse this JSON data, do
//
//     final verManoResponse = verManoResponseFromJson(jsonString);

import 'dart:convert';

import 'Carta.dart';

VerManoResponse verManoResponseFromJson(String str) => VerManoResponse.fromJson(json.decode(str));

String verManoResponseToJson(VerManoResponse data) => json.encode(data.toJson());

class VerManoResponse {
  List<Carta> cartas;
  bool success;

  VerManoResponse({
    required this.cartas,
    required this.success,
  });

  factory VerManoResponse.fromJson(Map<String, dynamic> json) => VerManoResponse(
    cartas: List<Carta>.from(json["cartas"].map((x) => Carta.fromJson(x))),
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "cartas": List<dynamic>.from(cartas.map((x) => x.toJson())),
    "success": success,
  };
}


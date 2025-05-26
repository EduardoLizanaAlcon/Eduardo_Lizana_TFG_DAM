// To parse this JSON data, do
//
//     final comprobarRondaResponse = comprobarRondaResponseFromJson(jsonString);

import 'dart:convert';

ComprobarRondaResponse comprobarRondaResponseFromJson(String str) => ComprobarRondaResponse.fromJson(json.decode(str));

String comprobarRondaResponseToJson(ComprobarRondaResponse data) => json.encode(data.toJson());

class ComprobarRondaResponse {
  bool success;
  int? ganador;

  ComprobarRondaResponse({
    required this.success,
    this.ganador,
  });

  factory ComprobarRondaResponse.fromJson(Map<String, dynamic> json) => ComprobarRondaResponse(
    success: json["success"],
    ganador: json["ganador"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "ganador": ganador,
  };
}

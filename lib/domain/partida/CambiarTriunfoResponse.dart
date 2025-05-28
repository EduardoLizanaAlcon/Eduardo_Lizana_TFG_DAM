// To parse this JSON data, do
//
//     final cambiarTriunfoResponse = cambiarTriunfoResponseFromJson(jsonString);

import 'dart:convert';

CambiarTriunfoResponse cambiarTriunfoResponseFromJson(String str) => CambiarTriunfoResponse.fromJson(json.decode(str));

String cambiarTriunfoResponseToJson(CambiarTriunfoResponse data) => json.encode(data.toJson());

class CambiarTriunfoResponse {
  bool success;
  String? mensaje;

  CambiarTriunfoResponse({
    required this.success,
    this.mensaje,
  });

  factory CambiarTriunfoResponse.fromJson(Map<String, dynamic> json) => CambiarTriunfoResponse(
    success: json["success"],
    mensaje: json["mensaje"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "mensaje": mensaje,
  };
}

// To parse this JSON data, do
//
//     final verTriunfoResponse = verTriunfoResponseFromJson(jsonString);

import 'dart:convert';

VerTriunfoResponse verTriunfoResponseFromJson(String str) => VerTriunfoResponse.fromJson(json.decode(str));

String verTriunfoResponseToJson(VerTriunfoResponse data) => json.encode(data.toJson());

class VerTriunfoResponse {
  List<Cartas> cartas;
  bool success;

  VerTriunfoResponse({
    required this.cartas,
    required this.success,
  });

  factory VerTriunfoResponse.fromJson(Map<String, dynamic> json) => VerTriunfoResponse(
    cartas: List<Cartas>.from(json["cartas"].map((x) => Cartas.fromJson(x))),
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "cartas": List<dynamic>.from(cartas.map((x) => x.toJson())),
    "success": success,
  };
}

class Cartas {
  String code;
  String image;
  Images images;
  String value;
  String suit;

  Cartas({
    required this.code,
    required this.image,
    required this.images,
    required this.value,
    required this.suit,
  });

  factory Cartas.fromJson(Map<String, dynamic> json) => Cartas(
    code: json["code"],
    image: json["image"],
    images: Images.fromJson(json["images"]),
    value: json["value"],
    suit: json["suit"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "image": image,
    "images": images.toJson(),
    "value": value,
    "suit": suit,
  };
}

class Images {
  String svg;
  String png;

  Images({
    required this.svg,
    required this.png,
  });

  factory Images.fromJson(Map<String, dynamic> json) => Images(
    svg: json["svg"],
    png: json["png"],
  );

  Map<String, dynamic> toJson() => {
    "svg": svg,
    "png": png,
  };
}

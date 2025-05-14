// To parse this JSON data, do
//
//     final verTriunfoResponse = verTriunfoResponseFromJson(jsonString);

import 'dart:convert';


VerGlobalResponse verGlobalResponseFromJson(String str) => VerGlobalResponse.fromJson(json.decode(str));

String verGlobalResponseToJson(VerGlobalResponse data) => json.encode(data.toJson());

class VerGlobalResponse {
  List<Csarta> cartas;
  bool success;

  VerGlobalResponse({
    required this.cartas,
    required this.success,
  });

  factory VerGlobalResponse.fromJson(Map<String, dynamic> json) => VerGlobalResponse(
    cartas: List<Csarta>.from(json["cartas"].map((x) => Csarta.fromJson(x))),
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "cartas": List<dynamic>.from(cartas.map((x) => x.toJson())),
    "success": success,
  };
}

class Csarta {
  String code;
  String image;
  Images images;
  String value;
  String suit;

  Csarta({
    required this.code,
    required this.image,
    required this.images,
    required this.value,
    required this.suit,
  });

  factory Csarta.fromJson(Map<String, dynamic> json) => Csarta(
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

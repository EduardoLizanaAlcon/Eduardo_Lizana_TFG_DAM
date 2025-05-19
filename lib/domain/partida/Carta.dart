
class Carta {
  String code;
  String image;
  Images images;
  String value;
  String suit;

  Carta({
    required this.code,
    required this.image,
    required this.images,
    required this.value,
    required this.suit,
  });

  factory Carta.fromJson(Map<String, dynamic> json) => Carta(
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
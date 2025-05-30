// To parse this JSON data, do
//
//     final jugarCartaResponse = jugarCartaResponseFromJson(jsonString);

import 'dart:convert';

JugarCartaResponse jugarCartaResponseFromJson(String str) => JugarCartaResponse.fromJson(json.decode(str));

String jugarCartaResponseToJson(JugarCartaResponse data) => json.encode(data.toJson());

class JugarCartaResponse {
  bool success;
  String? carta;
  bool? primeroenJugar;
  InfoRonda? infoRonda;
  InfoGanador? infoGanador;

  JugarCartaResponse({
    required this.success,
    this.carta,
    this.primeroenJugar,
    this.infoRonda,
    this.infoGanador,
  });

  factory JugarCartaResponse.fromJson(Map<String, dynamic> json) => JugarCartaResponse(
    success: json["success"],
    carta: json["carta"],
    primeroenJugar: json["primeroenJugar"],
    infoRonda: json["infoRonda"] == null ? null : InfoRonda.fromJson(json["infoRonda"]),
    infoGanador: json["infoGanador"] == null ? null : InfoGanador.fromJson(json["infoGanador"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "carta": carta,
    "primeroenJugar": primeroenJugar,
    "infoRonda": infoRonda?.toJson(),
    "infoGanador": infoGanador?.toJson(),
  };
}

class InfoGanador {
  bool? success;
  int? ganador;
  List<String>? cartasGanadas;
  List<int>? cartasRepartidas;
  String? triunfo;
  int? siguienteJugador;
  InformacionCoto? informacionCoto;
  String? estadoPartida;
  InformacionPartida? informacionPartida;

  InfoGanador({
    this.success,
    this.ganador,
    this.cartasGanadas,
    this.cartasRepartidas,
    this.triunfo,
    this.siguienteJugador,
    this.informacionCoto,
    this.estadoPartida,
    this.informacionPartida,
  });

  factory InfoGanador.fromJson(Map<String, dynamic> json) => InfoGanador(
    success: json["success"],
    ganador: json["ganador"],
    cartasGanadas: json["cartasGanadas"] == null ? [] : List<String>.from(json["cartasGanadas"]!.map((x) => x)),
    cartasRepartidas: json["cartasRepartidas"] == null ? [] : List<int>.from(json["cartasRepartidas"]!.map((x) => x)),
    triunfo: json["triunfo"],
    siguienteJugador: json["siguiente_jugador"],
    informacionCoto: json["informacion_coto"] == null ? null : InformacionCoto.fromJson(json["informacion_coto"]),
    estadoPartida: json["estado_partida"],
    informacionPartida: json["informacion_partida"] == null ? null : InformacionPartida.fromJson(json["informacion_partida"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "ganador": ganador,
    "cartasGanadas": cartasGanadas == null ? [] : List<dynamic>.from(cartasGanadas!.map((x) => x)),
    "cartasRepartidas": cartasRepartidas == null ? [] : List<dynamic>.from(cartasRepartidas!.map((x) => x)),
    "triunfo": triunfo,
    "siguiente_jugador": siguienteJugador,
    "informacion_coto": informacionCoto?.toJson(),
    "estado_partida": estadoPartida,
    "informacion_partida": informacionPartida?.toJson(),
  };
}

class InformacionCoto {
  bool? success;
  int? puntosEquipo1;
  int? puntosEquipo2;
  String? ganador;

  InformacionCoto({
    this.success,
    this.puntosEquipo1,
    this.puntosEquipo2,
    this.ganador,
  });

  factory InformacionCoto.fromJson(Map<String, dynamic> json) => InformacionCoto(
    success: json["success"],
    puntosEquipo1: json["puntos_equipo1"],
    puntosEquipo2: json["puntos_equipo2"],
    ganador: json["ganador"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "puntos_equipo1": puntosEquipo1,
    "puntos_equipo2": puntosEquipo2,
    "ganador": ganador,
  };
}

class InformacionPartida {
  bool? success;
  int? partidaId;
  String? ganador;
  bool? finalizada;

  InformacionPartida({
    this.success,
    this.partidaId,
    this.ganador,
    this.finalizada,
  });

  factory InformacionPartida.fromJson(Map<String, dynamic> json) => InformacionPartida(
    success: json["success"],
    partidaId: json["partida_id"],
    ganador: json["ganador"],
    finalizada: json["finalizada"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "partida_id": partidaId,
    "ganador": ganador,
    "finalizada": finalizada,
  };
}

class InfoRonda {
  bool? success;
  int? infoRondaSet;
  InfoJugador? infoJugador1;
  InfoJugador? infoJugador2;

  InfoRonda({
    this.success,
    this.infoRondaSet,
    this.infoJugador1,
    this.infoJugador2,
  });

  factory InfoRonda.fromJson(Map<String, dynamic> json) => InfoRonda(
    success: json["success"],
    infoRondaSet: json["set"],
    infoJugador1: json["infoJugador1"] == null ? null : InfoJugador.fromJson(json["infoJugador1"]),
    infoJugador2: json["infoJugador2"] == null ? null : InfoJugador.fromJson(json["infoJugador2"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "set": infoRondaSet,
    "infoJugador1": infoJugador1?.toJson(),
    "infoJugador2": infoJugador2?.toJson(),
  };
}

class InfoJugador {
  String? id;
  Cartas? cartas;

  InfoJugador({
    this.id,
    this.cartas,
  });

  factory InfoJugador.fromJson(Map<String, dynamic> json) => InfoJugador(
    id: json["id"],
    cartas: json["cartas"] == null ? null : Cartas.fromJson(json["cartas"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "cartas": cartas?.toJson(),
  };
}

class Cartas {
  int? remaining;
  List<Card>? cards;

  Cartas({
    this.remaining,
    this.cards,
  });

  factory Cartas.fromJson(Map<String, dynamic> json) => Cartas(
    remaining: json["remaining"],
    cards: json["cards"] == null ? [] : List<Card>.from(json["cards"]!.map((x) => Card.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "remaining": remaining,
    "cards": cards == null ? [] : List<dynamic>.from(cards!.map((x) => x.toJson())),
  };
}

class Card {
  String? code;
  String? image;
  Images? images;
  String? value;
  String? suit;

  Card({
    this.code,
    this.image,
    this.images,
    this.value,
    this.suit,
  });

  factory Card.fromJson(Map<String, dynamic> json) => Card(
    code: json["code"],
    image: json["image"],
    images: json["images"] == null ? null : Images.fromJson(json["images"]),
    value: json["value"],
    suit: json["suit"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "image": image,
    "images": images?.toJson(),
    "value": value,
    "suit": suit,
  };
}

class Images {
  String? svg;
  String? png;

  Images({
    this.svg,
    this.png,
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
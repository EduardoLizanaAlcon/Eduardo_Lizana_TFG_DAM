// To parse this JSON data, do
//
//     final verTriunfo = verTriunfoFromJson(jsonString);

import 'dart:convert';

VerGlobal VerGlobalFromJson(String str) => VerGlobal.fromJson(json.decode(str));

String VerGlobalToJson(VerGlobal data) => json.encode(data.toJson());

class VerGlobal {
  String idBaraja;

  VerGlobal({
    required this.idBaraja,
  });

  factory VerGlobal.fromJson(Map<String, dynamic> json) => VerGlobal(
    idBaraja: json["idBaraja"],
  );

  Map<String, dynamic> toJson() => {
    "idBaraja": idBaraja,
  };
}

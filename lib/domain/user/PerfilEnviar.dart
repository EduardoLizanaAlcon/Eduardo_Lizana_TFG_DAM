// To parse this JSON data, do
//
//     final perfilEnviar = perfilEnviarFromJson(jsonString);

import 'dart:convert';

PerfilEnviar perfilEnviarFromJson(String str) => PerfilEnviar.fromJson(json.decode(str));

String perfilEnviarToJson(PerfilEnviar data) => json.encode(data.toJson());

class PerfilEnviar {
  int? idUsuario;
  String? usuario;
  String? nombre;
  String? apellido;
  int? numTel;

  PerfilEnviar({
    this.idUsuario,
    this.usuario,
    this.nombre,
    this.apellido,
    this.numTel,
  });

  factory PerfilEnviar.fromJson(Map<String, dynamic> json) => PerfilEnviar(
    idUsuario: json["id_usuario"],
    usuario: json["usuario"],
    nombre: json["nombre"],
    apellido: json["apellido"],
    numTel: json["num_tel"],
  );

  Map<String, dynamic> toJson() => {
    "id_usuario": idUsuario,
    "usuario": usuario,
    "nombre": nombre,
    "apellido": apellido,
    "num_tel": numTel,
  };
}

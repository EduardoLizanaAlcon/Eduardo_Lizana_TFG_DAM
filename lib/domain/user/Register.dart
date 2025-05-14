// To parse this JSON data, do
//
//     final register = registerFromJson(jsonString);

import 'dart:convert';

Register registerFromJson(String str) => Register.fromJson(json.decode(str));

String registerToJson(Register data) => json.encode(data.toJson());

class Register {
  String? usuario;
  String? contrasena;
  String? nombre;
  String? apellido;
  String? numTel;

  Register({
    this.usuario,
    this.contrasena,
    this.nombre,
    this.apellido,
    this.numTel,
  });

  factory Register.fromJson(Map<String, dynamic> json) => Register(
    usuario: json["usuario"],
    contrasena: json["contrasena"],
    nombre: json["nombre"],
    apellido: json["apellido"],
    numTel: json["num_tel"],
  );

  Map<String, dynamic> toJson() => {
    "usuario": usuario,
    "contrasena": contrasena,
    "nombre": nombre,
    "apellido": apellido,
    "num_tel": numTel,
  };
}

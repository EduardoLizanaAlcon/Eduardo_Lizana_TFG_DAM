// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  bool success;
  String mensaje;
  Usuario usuario;

  LoginResponse({
    required this.success,
    required this.mensaje,
    required this.usuario,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    success: json["success"],
    mensaje: json["mensaje"],
    usuario: Usuario.fromJson(json["usuario"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "mensaje": mensaje,
    "usuario": usuario.toJson(),
  };
}

class Usuario {
  int id;
  String usuario;
  String contrasena;
  String nombre;
  String apellido;
  int numTel;
  int partidasGanadas;
  int partidasJugadas;

  Usuario({
    required this.id,
    required this.usuario,
    required this.contrasena,
    required this.nombre,
    required this.apellido,
    required this.numTel,
    required this.partidasGanadas,
    required this.partidasJugadas,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
    id: json["id"],
    usuario: json["usuario"],
    contrasena: json["contrasena"],
    nombre: json["nombre"],
    apellido: json["apellido"],
    numTel: json["num_tel"],
    partidasGanadas: json["partidas_ganadas"],
    partidasJugadas: json["partidas_jugadas"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "usuario": usuario,
    "contrasena": contrasena,
    "nombre": nombre,
    "apellido": apellido,
    "num_tel": numTel,
    "partidas_ganadas": partidasGanadas,
    "partidas_jugadas": partidasJugadas,
  };
}


class UserLogin {
  int id;
  String name;
  String surname;
  String gender;
  DateTime dateOfBirth;
  String phoneNumber;
  String? email;
  String? emailVerifiedAt;
  String? vatNumber;
  int isPremium;
  String? address;
  String? locality;
  int? provinceId;
  int? accountNumber;
  int? rotationAppUserExerciseId;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime? deletedAt;

  UserLogin({
    required this.id,
    required this.name,
    required this.surname,
    required this.gender,
    required this.dateOfBirth,
    required this.phoneNumber,
    this.email,
    this.emailVerifiedAt,
    this.vatNumber,
    required this.isPremium,
    this.address,
    this.locality,
    this.provinceId,
    this.accountNumber,
    this.rotationAppUserExerciseId,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  factory UserLogin.fromJson(Map<String, dynamic> json) => UserLogin(
    id: json["id"],
    name: json["name"],
    surname: json["surname"],
    gender: json["gender"],
    dateOfBirth: DateTime.parse(json["date_of_birth"]),
    phoneNumber: json["phone_number"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    vatNumber: json["vat_number"],
    isPremium: json["is_premium"],
    address: json["address"],
    locality: json["locality"],
    provinceId: json["province_id"],
    accountNumber: json["account_number"],
    rotationAppUserExerciseId: json["rotation_app_user_exercise_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "surname": surname,
    "gender": gender,
    "date_of_birth": "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
    "phone_number": phoneNumber,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "vat_number": vatNumber,
    "is_premium": isPremium,
    "address": address,
    "locality": locality,
    "province_id": provinceId,
    "account_number": accountNumber,
    "rotation_app_user_exercise_id": rotationAppUserExerciseId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "deleted_at": deletedAt,
  };
}

class ErrorsLogin {
  List<String>? phoneNumber;
  List<String>? password;

  ErrorsLogin({
    this.phoneNumber,
    this.password,
  });

  factory ErrorsLogin.fromJson(Map<String, dynamic> json) => ErrorsLogin(
    phoneNumber: json["phone_number"] != null ? List<String>.from(json["phone_number"]) : null,
    password: json["password"] != null ? List<String>.from(json["password"]) : null,
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (phoneNumber != null) data["phone_number"] = phoneNumber;
    if (password != null) data["password"] = password;
    return data;
  }
}


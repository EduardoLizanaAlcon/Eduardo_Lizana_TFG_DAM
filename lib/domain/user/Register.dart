// To parse this JSON data, do
//
//     final register = registerFromJson(jsonString);

import 'dart:convert';

Register registerFromJson(String str) => Register.fromJson(json.decode(str));

String registerToJson(Register data) => json.encode(data.toJson());

class Register {
  String name;
  String surname;
  String gender;
  DateTime dateOfBirth;
  String phoneNumber;
  String password;
  String passwordConfirmation;
  int is_premium;

  Register({
    required this.name,
    required this.surname,
    required this.gender,
    required this.dateOfBirth,
    required this.phoneNumber,
    required this.password,
    required this.passwordConfirmation,
    required this.is_premium,
  });

  factory Register.fromJson(Map<String, dynamic> json) => Register(
    name: json["name"],
    surname: json["surname"],
    gender: json["gender"],
    dateOfBirth: DateTime.parse(json["date_of_birth"]),
    phoneNumber: json["phone_number"],
    password: json["password"],
    passwordConfirmation: json["password_confirmation"],
    is_premium: json["is_premium"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "surname": surname,
    "gender": gender,
    "date_of_birth": "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
    "phone_number": phoneNumber,
    "password": password,
    "password_confirmation": passwordConfirmation,
    "is_premium": is_premium,
  };
}

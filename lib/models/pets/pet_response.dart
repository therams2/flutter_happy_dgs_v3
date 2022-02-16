// To parse this JSON data, do
//
//     final petResponse = petResponseFromJson(jsonString);

import 'dart:convert';

import 'package:happy_dogs_v2/models/pets/pet.dart';

PetResponse petResponseFromJson(String str) => PetResponse.fromJson(json.decode(str));

String petResponseToJson(PetResponse data) => json.encode(data.toJson());

class PetResponse {
  PetResponse({
    required this.ok,
    required this.pet,
    required this.msg,
  });

  bool ok;
  List<Pet> pet;
  String msg;

  factory PetResponse.fromJson(Map<String, dynamic> json) => PetResponse(
    ok: json["ok"],
    pet: List<Pet>.from(json["pet"].map((x) => Pet.fromJson(x))),
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "ok": ok,
    "pet": List<dynamic>.from(pet.map((x) => x.toJson())),
    "msg": msg,
  };
}


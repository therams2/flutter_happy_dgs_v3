// To parse this JSON data, do
//
//     final tariffResponse = tariffResponseFromJson(jsonString);

import 'dart:convert';


import 'package:happy_dogs_v2/models/tariff/tariff.dart';

TariffResponse tariffResponseFromJson(String str) => TariffResponse.fromJson(json.decode(str));

String tariffResponseToJson(TariffResponse data) => json.encode(data.toJson());

class TariffResponse {
  TariffResponse({
    required this.ok,
    required this.tariffs,
    required this.msg,
  });

  bool ok;
  List<Tariff> tariffs;
  String msg;

  factory TariffResponse.fromJson(Map<String, dynamic> json) => TariffResponse(
    ok: json["ok"],
    tariffs: List<Tariff>.from(json["tariffs"].map((x) => Tariff.fromJson(x))),
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "ok": ok,
    "tariffs": List<dynamic>.from(tariffs.map((x) => x.toJson())),
    "msg": msg,
  };
}



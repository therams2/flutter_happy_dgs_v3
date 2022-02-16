// To parse this JSON data, do
//
//     final validatedTokenResponse = validatedTokenResponseFromJson(jsonString);

import 'dart:convert';

ValidatedTokenResponse validatedTokenResponseFromJson(String str) => ValidatedTokenResponse.fromJson(json.decode(str));

String validatedTokenResponseToJson(ValidatedTokenResponse data) => json.encode(data.toJson());

class ValidatedTokenResponse {
  ValidatedTokenResponse({
    required this.ok,
    required this.msg,
  });

  bool ok;
  String msg;

  factory ValidatedTokenResponse.fromJson(Map<String, dynamic> json) => ValidatedTokenResponse(
    ok: json["ok"],
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "ok": ok,
    "msg": msg,
  };
}

// To parse this JSON data, do
//
//     final signin = signinFromJson(jsonString);

import 'dart:convert';

Signin signinFromJson(String str) => Signin.fromJson(json.decode(str));

String signinToJson(Signin data) => json.encode(data.toJson());

class Signin {
  Signin({
    required this.ok,
    required this.userId,
    required this.token,
  });

  bool ok;
  int userId;
  String token;

  factory Signin.fromJson(Map<String, dynamic> json) => Signin(
    ok: json["ok"],
    userId: json["userId"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "ok": ok,
    "userId": userId,
    "token": token,
  };
}

// To parse this JSON data, do
//
//     final userLoginResponse = userLoginResponseFromJson(jsonString);

import 'dart:convert';

UserLoginResponse userLoginResponseFromJson(String str) => UserLoginResponse.fromJson(json.decode(str));

String userLoginResponseToJson(UserLoginResponse data) => json.encode(data.toJson());

class UserLoginResponse {
  UserLoginResponse({
    required this.ok,
    this.userId,
    required this.token,
  });

  bool ok;
  int? userId;
  String token;

  factory UserLoginResponse.fromJson(Map<String, dynamic> json) => UserLoginResponse(
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

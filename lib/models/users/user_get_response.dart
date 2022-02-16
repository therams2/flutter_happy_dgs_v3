// To parse this JSON data, do
//
//     final userGetResponse = userGetResponseFromJson(jsonString);

import 'dart:convert';

import 'package:happy_dogs_v2/models/users/user.dart';

UserGetResponse userGetResponseFromJson(String str) => UserGetResponse.fromJson(json.decode(str));

String userGetResponseToJson(UserGetResponse data) => json.encode(data.toJson());

class UserGetResponse {
  UserGetResponse({
    required this.ok,
    required this.user,
  });

  bool ok;
  User user;

  factory UserGetResponse.fromJson(Map<String, dynamic> json) => UserGetResponse(
    ok: json["ok"],
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "ok": ok,
    "user": user.toJson(),
  };
}

class User {
  User({
    required this.id,
    required this.email,
    required this.password,
    required this.name,
    required this.isClient,
    required this.updatedAt,
    required this.createdAt,
  });

  int id;
  String email;
  String password;
  String name;
  int isClient;
  DateTime updatedAt;
  DateTime createdAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    email: json["email"],
    password: json["password"],
    name: json["name"],
    isClient: json["isClient"],
    updatedAt: DateTime.parse(json["updatedAt"]),
    createdAt: DateTime.parse(json["createdAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "password": password,
    "name": name,
    "isClient": isClient,
    "updatedAt": updatedAt.toIso8601String(),
    "createdAt": createdAt.toIso8601String(),
  };
}
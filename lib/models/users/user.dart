
class User {
  User({
    required this.id,
    required this.picturePath,
    required this.email,
    required this.password,
    required this.name,
    required this.dateOfBirth,
    required this.phone,
    required this.updatedAt,
    required this.createdAt,
  });

  int id;
  String picturePath;
  String email;
  String password;
  String name;
  DateTime dateOfBirth;
  String phone;
  DateTime updatedAt;
  DateTime createdAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    picturePath: json["picture_path"],
    email: json["email"],
    password: json["password"],
    name: json["name"],
    dateOfBirth: DateTime.parse(json["date_of_birth"]),
    phone: json["phone"],
    updatedAt: DateTime.parse(json["updatedAt"]),
    createdAt: DateTime.parse(json["createdAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "picture_path": picturePath,
    "email": email,
    "password": password,
    "name": name,
    "date_of_birth": "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
    "phone": phone,
    "updatedAt": updatedAt.toIso8601String(),
    "createdAt": createdAt.toIso8601String(),
  };
}

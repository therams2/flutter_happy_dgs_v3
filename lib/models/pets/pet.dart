
class Pet {
  Pet({
    required this.id,
    required this.userId,
    required this.picturePath,
    required this.name,
    required this.age,
    required this.race,
    required this.gender,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  int userId;
  String picturePath;
  String name;
  int age;
  String race;
  String gender;
  DateTime createdAt;
  DateTime updatedAt;

  factory Pet.fromJson(Map<String, dynamic> json) => Pet(
    id: json["id"],
    userId: json["user_id"],
    picturePath: json["picture_path"],
    name: json["name"],
    age: json["age"],
    race: json["race"],
    gender: json["gender"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "picture_path": picturePath,
    "name": name,
    "age": age,
    "race": race,
    "gender": gender,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}

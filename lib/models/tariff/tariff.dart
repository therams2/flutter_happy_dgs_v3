class Tariff {
  Tariff({
    required this.id,
    required this.name,
    required this.alias,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  String alias;
  String description;
  DateTime createdAt;
  DateTime updatedAt;

  factory Tariff.fromJson(Map<String, dynamic> json) => Tariff(
    id: json["id"],
    name: json["name"],
    alias: json["alias"],
    description: json["description"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "alias": alias,
    "description": description,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}
import 'dart:convert';

class Projects {
  int id;
  String name;
  String category;
  bool status;

  Projects({
    required this.id,
    required this.name,
    required this.category,
    required this.status,
  });

  factory Projects.fromRawJson(String str) =>
      Projects.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Projects.fromJson(Map<String, dynamic> json) => Projects(
        id: json["id"],
        name: json["name"],
        category: json["category"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "category": category,
        "status": status,
      };
}

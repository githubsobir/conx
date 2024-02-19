class MadelControllerBodyType {
  int id;
  String name;
  String image;

  MadelControllerBodyType({
    required this.id,
    required this.name,
    required this.image,
  });

  factory MadelControllerBodyType.fromJson(Map<String, dynamic> json) => MadelControllerBodyType(
    id: json["id"],
    name: json["name"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
  };
}

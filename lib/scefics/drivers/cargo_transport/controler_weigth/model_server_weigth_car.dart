class MadelWeigthCarServer {
  int id;
  String name;
  String description;

  MadelWeigthCarServer({
    required this.id,
    required this.name,
    required this.description,
  });

  factory MadelWeigthCarServer.fromJson(Map<String, dynamic> json) => MadelWeigthCarServer(
    id: json["id"],
    name: json["name"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
  };
}

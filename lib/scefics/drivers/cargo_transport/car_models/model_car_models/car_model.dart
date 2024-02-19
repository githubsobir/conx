class MadelCarModel {
  dynamic id;
  dynamic name;
  dynamic description;

  MadelCarModel({
     this.id,
     this.name,
     this.description,
  });

  factory MadelCarModel.fromJson(Map<String, dynamic> json) => MadelCarModel(
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

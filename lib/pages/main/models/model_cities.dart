class ModelGetCities {
  dynamic id;
  dynamic name;

  ModelGetCities({
     this.id,
     this.name,
  });

  factory ModelGetCities.fromJson(Map<String, dynamic> json) => ModelGetCities(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

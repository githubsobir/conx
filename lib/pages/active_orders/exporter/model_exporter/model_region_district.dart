
class ModelRegionDistrict {
  int id;
  String name;

  ModelRegionDistrict({
    required this.id,
    required this.name,
  });

  factory ModelRegionDistrict.fromJson(Map<String, dynamic> json) => ModelRegionDistrict(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

class MadelManufacturers {
  dynamic id;
  dynamic name;

  MadelManufacturers({
     this.id,
     this.name,
  });

  factory MadelManufacturers.fromJson(Map<String, dynamic> json) => MadelManufacturers(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

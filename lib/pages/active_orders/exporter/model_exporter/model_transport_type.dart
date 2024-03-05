class ModelTransportType {
  dynamic id;
  dynamic name;
  dynamic image;

  ModelTransportType({
    this.id,
    this.name,
    this.image,
  });

  factory ModelTransportType.fromJson(Map<String, dynamic> json) => ModelTransportType(
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

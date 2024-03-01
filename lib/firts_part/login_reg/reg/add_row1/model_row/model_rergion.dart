class ModelRegion {
  dynamic id;
  dynamic name;
  dynamic flagImg;
  dynamic code;

  ModelRegion({
    this.id,
    this.name,
    this.flagImg,
    this.code,
  });

  factory ModelRegion.fromJson(Map<String, dynamic> json) => ModelRegion(
    id: json["id"],
    name: json["name"],
    flagImg: json["flag_img"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "flag_img": flagImg,
    "code": code,
  };
}

class ModelCountryList {
  int id;
  String name;
  String flagImg;
  String code;

  ModelCountryList({
    required this.id,
    required this.name,
    required this.flagImg,
    required this.code,
  });

  factory ModelCountryList.fromJson(Map<String, dynamic> json) => ModelCountryList(
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

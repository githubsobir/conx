class ModelCountryList {
  dynamic id;
  dynamic name;
  dynamic flagImg;
  dynamic code;

  ModelCountryList({
     this.id,
     this.name,
     this.flagImg,
     this.code,
  });

  factory ModelCountryList.fromJson(Map<String, dynamic> json) => ModelCountryList(
    id: json["id"]??"",
    name: json["name"]??"",
    flagImg: json["flag_img"]??"",
    code: json["code"]??"",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "flag_img": flagImg,
    "code": code,
  };
}

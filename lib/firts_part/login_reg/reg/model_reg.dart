class ModelRegCountry {
  dynamic id;
  dynamic name;
  dynamic flagImg;
  dynamic code;

  ModelRegCountry({
    this.id,
    this.name,
    this.flagImg,
    this.code,
  });

  factory ModelRegCountry.fromJson(Map<String, dynamic> json) =>
      ModelRegCountry(
        id: json["id"],
        name: json["name"],
        flagImg: json["flag_img"],
        code: json["code"]??"+998",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "flag_img": flagImg,
        "code": code,
      };
}


class ModelForRegServer{
  bool boolGetData;
  String txtError;

  ModelForRegServer({required this.boolGetData, required this.txtError});
  ModelForRegServer copyWith({
    required bool boolGetData1,
    required String txtError1,
  }) {
    return ModelForRegServer(
      boolGetData: boolGetData1,
      txtError: txtError1,
    );
  }

  factory ModelForRegServer.fromJson(Map<String, dynamic> json) {
    return ModelForRegServer(
      boolGetData: json["boolGetData"],
      txtError: json["txtError"],
    );
  }
}




class ModelPassportFile {
  String seriaNum;
  String frontSide;
  String withResidence;
  String faceImg;

  ModelPassportFile({
    required this.seriaNum,
    required this.frontSide,
    required this.withResidence,
    required this.faceImg,
  });

  factory ModelPassportFile.fromJson(Map<String, dynamic> json) => ModelPassportFile(
    seriaNum: json["seria_num"],
    frontSide: json["front_side"],
    withResidence: json["with_residence"],
    faceImg: json["face_img"],
  );

  Map<String, dynamic> toJson() => {
    "seria_num": seriaNum,
    "front_side": frontSide,
    "with_residence": withResidence,
    "face_img": faceImg,
  };
}

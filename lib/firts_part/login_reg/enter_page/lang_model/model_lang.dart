class ModelLanguage {
  int id;
  String langName;
  String note;
  String imageAssetLink;
  String langId1;
  String langId2;
  bool boolLang;

  ModelLanguage({
    required this.id,
    required this.langName,
    required this.langId1,
    required this.langId2,
    required this.imageAssetLink,
    required this.note,
    required this.boolLang,
  });

  factory ModelLanguage.fromJson(Map<String, dynamic> json) {
    return ModelLanguage(
        id: json["id"],
        langName: json["langName"],
        langId1: json["langId1"],
        langId2: json["langId2"],
        imageAssetLink: json["imageAssetLink"],
        boolLang: json["boolLang"],
        note: json["note"]);
  }
}

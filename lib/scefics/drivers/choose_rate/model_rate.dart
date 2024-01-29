class ModelChooseRate {
  int id;
  String nameRate;
  String textRate;
  String imageAssetLink;
  bool boolActive;
  String note;

  ModelChooseRate({
    required this.id,
    required this.nameRate,
    required this.textRate,
    required this.imageAssetLink,
    required this.boolActive,
    required this.note,
  });

  factory ModelChooseRate.fromJson(Map<String, dynamic> json) {
    return ModelChooseRate(
        id: json["id"],
        nameRate: json["nameRate"],
        textRate: json["textRate"],
        imageAssetLink: json["imageAssetLink"],
        boolActive: json["boolActive"],
        note: json["note"]);
  }
}

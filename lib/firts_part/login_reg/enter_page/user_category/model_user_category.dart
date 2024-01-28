class ModelUserCategory {
  int id;
  String nameCategory;
  String textCategory;
  String imageAssetLink;
  bool boolActive;
  String note;

  ModelUserCategory({
    required this.id,
    required this.nameCategory,
    required this.textCategory,
    required this.imageAssetLink,
    required this.boolActive,
    required this.note,
  });

  factory ModelUserCategory.fromJson(Map<String, dynamic> json) {
    return ModelUserCategory(
        id: json["id"],
        nameCategory: json["nameCategory"],
        textCategory: json["textCategory"],
        imageAssetLink: json["imageAssetLink"],
        boolActive: json["boolActive"],
        note: json["note"]);
  }
}

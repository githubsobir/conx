class ModelDriverModel {
  String name;
  String action;
  String note;

  ModelDriverModel({
    required this.name,
    required this.action,
    required this.note,
  });

  factory ModelDriverModel.fromJson(Map<String, dynamic> json) => ModelDriverModel(
    name: json["name"],
    action: json["action"],
    note: json["note"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "action": action,
    "note": note,
  };
}

class MadelCarColor {
  dynamic id;
  dynamic name;
  dynamic color;

  MadelCarColor({
    this.id,
    this.name,
    this.color,
  });

  factory MadelCarColor.fromJson(Map<String, dynamic> json) => MadelCarColor(
        id: json["id"],
        name: json["name"],
        color: json["color"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "color": color,
      };
}

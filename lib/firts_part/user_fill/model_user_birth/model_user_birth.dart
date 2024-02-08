class ModelUserBirth {
  String date;

  ModelUserBirth({
    required this.date,
  });

  factory ModelUserBirth.fromJson(Map<String, dynamic> json) => ModelUserBirth(
    date: json["date"],
  );

  Map<String, dynamic> toJson() => {
    "date": date,
  };
}

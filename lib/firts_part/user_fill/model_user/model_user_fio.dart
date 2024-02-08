class ModelUserFio {
  dynamic name;
  dynamic lastName;
  dynamic surname;

  ModelUserFio({
    required this.name,
    required this.lastName,
    required this.surname,
  });

  factory ModelUserFio.fromJson(Map<String, dynamic> json) => ModelUserFio(
    name: json["name"],
    lastName: json["last_name"],
    surname: json["surname"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "last_name": lastName,
    "surname": surname,
  };
}

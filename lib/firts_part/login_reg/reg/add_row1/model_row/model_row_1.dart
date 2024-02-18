class ModelRow1Choose {
  String statusData;
  String textError;
  String note;

  ModelRow1Choose(
      {required this.statusData, required this.textError, required this.note});

  ModelRow1Choose copyWith(

    String statusData1,
    String textError1,
    String note1,
  ) {
    return ModelRow1Choose(
        statusData: statusData1, textError: textError1, note: note1);
  }

  factory ModelRow1Choose.fromJson(Map<String, dynamic> json) {
    return ModelRow1Choose(
      statusData: json["statusData"],
      textError: json["textError"],
      note: json["note"],
    );
  }
}

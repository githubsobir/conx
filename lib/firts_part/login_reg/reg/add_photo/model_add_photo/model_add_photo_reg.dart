class ModelAddPhotoReg {
  String statusData;
  String textError;
  String note;

  ModelAddPhotoReg(
      {required this.statusData, required this.textError, required this.note});

  ModelAddPhotoReg copyWith(

      String statusData1,
      String textError1,
      String note1,
      ) {
    return ModelAddPhotoReg(
        statusData: statusData1, textError: textError1, note: note1);
  }

  factory ModelAddPhotoReg.fromJson(Map<String, dynamic> json) {
    return ModelAddPhotoReg(
      statusData: json["statusData"],
      textError: json["textError"],
      note: json["note"],
    );
  }
}

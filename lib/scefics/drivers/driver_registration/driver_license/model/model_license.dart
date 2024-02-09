import 'dart:io';

class ModelLicense {
  bool boolGetData;
  String message;
  List<File> list;
  String errorMessage;

  ModelLicense({
    required this.boolGetData,
    required this.message,
    required this.list,
    required this.errorMessage,
  });

  ModelLicense copyWith({
    required bool boolGetData1,
    required String message1,
    required List<File> list,
    required String errorMessage1,
  }) {
    return ModelLicense(
      boolGetData: boolGetData1,
      message: message1,
      list: list,
      errorMessage: errorMessage1,
    );
  }

  factory ModelLicense.fromJson(Map<String, dynamic> json) => ModelLicense(
        boolGetData: json["boolGetData"],
        message: json["message"],
        list: json["list"],
        errorMessage: json["errorMessage"],
      );

  Map<String, dynamic> toJson() => {
        "boolGetData": boolGetData,
        "message": message,
        "list": list,
        "errorMessage": errorMessage,
      };
}

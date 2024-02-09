import 'dart:io';

class ModelPassport {
  bool boolGetData;
  String message;
  List<File> list;
  String errorMessage;

  ModelPassport({
    required this.boolGetData,
    required this.message,
    required this.list,
    required this.errorMessage,
  });

  ModelPassport copyWith({
    required bool boolGetData1,
    required String message1,
    required List<File> list,
    required String errorMessage1,
  }) {
    return ModelPassport(
      boolGetData: boolGetData1,
      message: message1,
      list: list,
      errorMessage: errorMessage1,
    );
  }

  factory ModelPassport.fromJson(Map<String, dynamic> json) =>
      ModelPassport(
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

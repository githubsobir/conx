class ModelControllerDriverReg {
  bool boolGetData;
  String message;
  List<String> list;
  String errorMessage;

  ModelControllerDriverReg({
    required this.boolGetData,
    required this.message,
    required this.list,
    required this.errorMessage,
  });

  ModelControllerDriverReg copyWith({
    required bool boolGetData1,
    required String message1,
    required List<String> list,
    required String errorMessage1,
  }) {
    return ModelControllerDriverReg(
      boolGetData: boolGetData1,
      message: message1,
      list: list,
      errorMessage: errorMessage1,
    );
  }

  factory ModelControllerDriverReg.fromJson(Map<String, dynamic> json) => ModelControllerDriverReg(
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

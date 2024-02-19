class ModelControllerBodyType {
  bool boolGetData;
  String message;
  String errorMessage;

  ModelControllerBodyType({
    required this.boolGetData,
    required this.message,
    required this.errorMessage,
  });

  ModelControllerBodyType copyWith({
    required bool boolGetData1,
    required String message1,
    required String errorMessage1,
  }) {
    return ModelControllerBodyType(
      boolGetData: boolGetData1,
      message: message1,
      errorMessage: errorMessage1,
    );
  }

  factory ModelControllerBodyType.fromJson(Map<String, dynamic> json) => ModelControllerBodyType(
    boolGetData: json["boolGetData"],
    message: json["message"],
    errorMessage: json["errorMessage"],
  );

  Map<String, dynamic> toJson() => {
    "boolGetData": boolGetData,
    "message": message,
    "errorMessage": errorMessage,
  };
}

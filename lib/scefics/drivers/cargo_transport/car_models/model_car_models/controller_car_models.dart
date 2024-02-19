class ModelCarModelController {
  bool boolGetData;
  String message;
  String errorMessage;

  ModelCarModelController({
    required this.boolGetData,
    required this.message,
    required this.errorMessage,
  });

  ModelCarModelController copyWith({
    required bool boolGetData1,
    required String message1,
    required String errorMessage1,
  }) {
    return ModelCarModelController(
      boolGetData: boolGetData1,
      message: message1,
      errorMessage: errorMessage1,
    );
  }

  factory ModelCarModelController.fromJson(Map<String, dynamic> json) => ModelCarModelController(
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

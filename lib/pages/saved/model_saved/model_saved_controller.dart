class ModelSavedController {
  bool boolGetData;
  String message;
  String errorMessage;

  ModelSavedController({
    required this.boolGetData,
    required this.message,
    required this.errorMessage,
  });

  ModelSavedController copyWith({
    required bool boolGetData1,
    required String message1,
    required String errorMessage1,
  }) {
    return ModelSavedController(
      boolGetData: boolGetData1,
      message: message1,
      errorMessage: errorMessage1,
    );
  }

  factory ModelSavedController.fromJson(Map<String, dynamic> json) =>
      ModelSavedController(
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

class ModelCarColorController {
  bool boolGetData;
  String message;
  String errorMessage;

  ModelCarColorController({
    required this.boolGetData,
    required this.message,
    required this.errorMessage,
  });

  ModelCarColorController copyWith({
    required bool boolGetData1,
    required String message1,
    required String errorMessage1,
  }) {
    return ModelCarColorController(
      boolGetData: boolGetData1,
      message: message1,
      errorMessage: errorMessage1,
    );
  }

  factory ModelCarColorController.fromJson(Map<String, dynamic> json) =>
      ModelCarColorController(
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

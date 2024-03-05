class ModelSearchController{
  bool boolGetData;
  String message;
  String errorMessage;

  ModelSearchController({
    required this.boolGetData,
    required this.message,
    required this.errorMessage,
  });

  ModelSearchController copyWith({
    required bool boolGetData1,
    required String message1,
    required String errorMessage1,
  }) {
    return ModelSearchController(
      boolGetData: boolGetData1,
      message: message1,

      errorMessage: errorMessage1,
    );
  }

  factory ModelSearchController.fromJson(Map<String, dynamic> json) => ModelSearchController(
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

class ModelWeightCar {
  bool boolGetData;
  String message;
  String errorMessage;

  ModelWeightCar({
    required this.boolGetData,
    required this.message,
    required this.errorMessage,
  });

  ModelWeightCar copyWith({
    required bool boolGetData1,
    required String message1,
    required String errorMessage1,
  }) {
    return ModelWeightCar(
      boolGetData: boolGetData1,
      message: message1,
      errorMessage: errorMessage1,
    );
  }

  factory ModelWeightCar.fromJson(Map<String, dynamic> json) => ModelWeightCar(
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

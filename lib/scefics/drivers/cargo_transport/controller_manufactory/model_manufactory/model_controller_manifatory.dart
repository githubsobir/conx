class ModelControllerManufacturers {
  bool boolGetData;
  String message;
  String errorMessage;

  ModelControllerManufacturers({
    required this.boolGetData,
    required this.message,
    required this.errorMessage,
  });

  ModelControllerManufacturers copyWith({
    required bool boolGetData1,
    required String message1,
    required String errorMessage1,
  }) {
    return ModelControllerManufacturers(
      boolGetData: boolGetData1,
      message: message1,
      errorMessage: errorMessage1,
    );
  }

  factory ModelControllerManufacturers.fromJson(Map<String, dynamic> json) => ModelControllerManufacturers(
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

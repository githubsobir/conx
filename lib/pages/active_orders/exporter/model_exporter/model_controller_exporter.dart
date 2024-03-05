class ModelControllerExporter {
  bool boolGetData;
  String message;
  String errorMessage;

  ModelControllerExporter({
    required this.boolGetData,
    required this.message,
    required this.errorMessage,
  });

  ModelControllerExporter copyWith({
    required bool boolGetData1,
    required String message1,
    required String errorMessage1,
  }) {
    return ModelControllerExporter(
      boolGetData: boolGetData1,
      message: message1,
      errorMessage: errorMessage1,
    );
  }

  factory ModelControllerExporter.fromJson(Map<String, dynamic> json) =>
      ModelControllerExporter(
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

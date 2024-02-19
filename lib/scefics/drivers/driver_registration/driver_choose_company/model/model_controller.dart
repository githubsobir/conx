class ModelControllerCompany {
  bool boolGetData;
  String message;
  String errorMessage;

  ModelControllerCompany({
    required this.boolGetData,
    required this.message,
    required this.errorMessage,
  });

  ModelControllerCompany copyWith({
    required bool boolGetData1,
    required String message1,
    required String errorMessage1,
  }) {
    return ModelControllerCompany(
      boolGetData: boolGetData1,
      message: message1,
      errorMessage: errorMessage1,
    );
  }

  factory ModelControllerCompany.fromJson(Map<String, dynamic> json) => ModelControllerCompany(
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

class ModelPayment {
  bool boolGetData;
  String message;
  String errorMessage;

  ModelPayment({
    required this.boolGetData,
    required this.message,
    required this.errorMessage,
  });

  ModelPayment copyWith({
    required bool boolGetData1,
    required String message1,
    required String errorMessage1,
  }) {
    return ModelPayment(
      boolGetData: boolGetData1,
      message: message1,
      errorMessage: errorMessage1,
    );
  }

  factory ModelPayment.fromJson(Map<String, dynamic> json) => ModelPayment(
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

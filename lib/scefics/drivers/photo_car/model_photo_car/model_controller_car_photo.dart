class ModelControllerPhoto {
  bool boolGetData;
  String message;
  String errorMessage;

  ModelControllerPhoto({
    required this.boolGetData,
    required this.message,
    required this.errorMessage,
  });

  ModelControllerPhoto copyWith({
    required bool boolGetData1,
    required String message1,
    required String errorMessage1,
  }) {
    return ModelControllerPhoto(
      boolGetData: boolGetData1,
      message: message1,
      errorMessage: errorMessage1,
    );
  }

  factory ModelControllerPhoto.fromJson(Map<String, dynamic> json) => ModelControllerPhoto(
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

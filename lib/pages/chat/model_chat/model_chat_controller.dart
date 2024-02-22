class ModelChatController {
  bool boolGetData;
  String message;
  String errorMessage;

  ModelChatController({
    required this.boolGetData,
    required this.message,
    required this.errorMessage,
  });

  ModelChatController copyWith({
    required bool boolGetData1,
    required String message1,
    required String errorMessage1,
  }) {
    return ModelChatController(
      boolGetData: boolGetData1,
      message: message1,
      errorMessage: errorMessage1,
    );
  }

  factory ModelChatController.fromJson(Map<String, dynamic> json) => ModelChatController(
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

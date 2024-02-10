class ModelControllerMainPage{
  bool boolGetData;
  String message;
  String errorMessage;

  ModelControllerMainPage({
  required this.boolGetData,
  required this.message,
  required this.errorMessage,
  });

  ModelControllerMainPage copyWith({
  required bool boolGetData1,
  required String message1,
  required String errorMessage1,
  }) {
  return ModelControllerMainPage(
  boolGetData: boolGetData1,
  message: message1,

  errorMessage: errorMessage1,
  );
  }

  factory ModelControllerMainPage.fromJson(Map<String, dynamic> json) => ModelControllerMainPage(
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

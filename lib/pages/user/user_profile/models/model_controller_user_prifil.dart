class ModelControllerUserProfile{
  bool boolGetData;
  String message;
  String errorMessage;

  ModelControllerUserProfile({
    required this.boolGetData,
    required this.message,
    required this.errorMessage,
  });

  ModelControllerUserProfile copyWith({
    required bool boolGetData1,
    required String message1,
    required String errorMessage1,
  }) {
    return ModelControllerUserProfile(
      boolGetData: boolGetData1,
      message: message1,

      errorMessage: errorMessage1,
    );
  }

  factory ModelControllerUserProfile.fromJson(Map<String, dynamic> json) => ModelControllerUserProfile(
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

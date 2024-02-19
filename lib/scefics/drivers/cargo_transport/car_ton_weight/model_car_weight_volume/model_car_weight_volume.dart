class ModelCarWeightVolumeController {
  bool boolGetData;
  String message;
  String errorMessage;

  ModelCarWeightVolumeController({
    required this.boolGetData,
    required this.message,
    required this.errorMessage,
  });

  ModelCarWeightVolumeController copyWith({
    required bool boolGetData1,
    required String message1,
    required String errorMessage1,
  }) {
    return ModelCarWeightVolumeController(
      boolGetData: boolGetData1,
      message: message1,
      errorMessage: errorMessage1,
    );
  }

  factory ModelCarWeightVolumeController.fromJson(Map<String, dynamic> json) =>
      ModelCarWeightVolumeController(
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

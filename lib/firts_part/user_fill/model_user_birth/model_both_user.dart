class ModelUserBirthController {
  bool success;
  String message;
  String errorMessage;

  ModelUserBirthController({
    required this.success,
    required this.message,
    required this.errorMessage,
  });

  ModelUserBirthController copyWith({
    required bool success1,
    required String message1,
    required String errorMessage1,
  }) {
    return ModelUserBirthController(
      success: success1,
      message: message1,
      errorMessage: errorMessage1,
    );
  }

  factory ModelUserBirthController.fromJson(Map<String, dynamic> json) =>
      ModelUserBirthController(
        success: json["success"],
        message: json["message"],
        errorMessage: json["errorMessage"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "errorMessage": errorMessage,
      };
}

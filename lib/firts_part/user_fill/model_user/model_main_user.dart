class ModelUserController {
  bool success;
  String message;
  String errorMessage;

  ModelUserController({
    required this.success,
    required this.message,
    required this.errorMessage,
  });

  ModelUserController copyWith({
    required bool success1,
    required String message1,
    required String errorMessage1,
  }) {
    return ModelUserController(
      success: success1,
      message: message1,
      errorMessage: errorMessage1,
    );
  }

  factory ModelUserController.fromJson(Map<String, dynamic> json) =>
      ModelUserController(
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

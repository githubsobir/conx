class ModelRegSentSuccess {
  bool success;
  String message;

  ModelRegSentSuccess({
    required this.success,
    required this.message,
  });

  factory ModelRegSentSuccess.fromJson(Map<String, dynamic> json) =>
      ModelRegSentSuccess(
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
      };
}

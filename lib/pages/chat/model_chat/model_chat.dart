class ModelChatController {
  dynamic boolGetData;
  dynamic errorMessage;
  dynamic note;

  ModelChatController(
      {required this.boolGetData,
      required this.errorMessage,
      required this.note});

  factory ModelChatController.fromJSon(Map<String, dynamic> json) {
    return ModelChatController(
        boolGetData: json["boolGetData"],
        errorMessage: json["errorMessage"],
        note: json["note"]);
  }

  ModelChatController.copyWith({
    dynamic boolGetData,
    dynamic errorMessage,
    dynamic note,
  }) {
    ModelChatController(
        boolGetData: boolGetData, errorMessage: errorMessage, note: note);
  }
}

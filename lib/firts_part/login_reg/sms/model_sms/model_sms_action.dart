class ModelSmsAction {
  bool boolGetData;
  String actionCode;
  String txtError;
  String txtSmsNote;

  ModelSmsAction(
      {required this.boolGetData,
      required this.txtError,
      required this.actionCode,
      required this.txtSmsNote,

      });

  ModelSmsAction copyWith({
    required bool boolGetData1,
    required String actionCode1,
    required String txtError1,
    required String txtSmsNote,
  }) {
    return ModelSmsAction(
        boolGetData: boolGetData1,
        txtError: txtError1,
        actionCode: actionCode1,
      txtSmsNote: txtSmsNote,

    );
  }


  factory ModelSmsAction.fromJson(Map<String, dynamic> json) {
    return ModelSmsAction(
      actionCode: json["actionCode"],
      boolGetData: json["boolGetData"],
      txtError: json["txtError"],
      txtSmsNote: json["txtSmsNote"],
    );
  }
}
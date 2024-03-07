class ModelCarTextController{
  bool boolGetData;
  String txtError;

  ModelCarTextController({required this.boolGetData, required this.txtError});
  ModelCarTextController copyWith({
    required bool boolGetData1,
    required String txtError1,
  }) {
    return ModelCarTextController(
      boolGetData: boolGetData1,
      txtError: txtError1,
    );
  }

  factory ModelCarTextController.fromJson(Map<String, dynamic> json) {
    return ModelCarTextController(
      boolGetData: json["boolGetData"],
      txtError: json["txtError"],
    );
  }
}




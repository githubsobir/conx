class ModelStateLogin{
bool boolGetData;
String txtError;

ModelStateLogin({required this.boolGetData, required this.txtError});
ModelStateLogin copyWith({
  required bool boolGetData1,
  required String txtError1,
}) {
  return ModelStateLogin(
    boolGetData: boolGetData1 ?? boolGetData,
    txtError: txtError1 ?? txtError,
  );
}

factory ModelStateLogin.fromJson(Map<String, dynamic> json) {
return ModelStateLogin(
boolGetData: json["boolGetData"],
txtError: json["txtError"],
);
}
}




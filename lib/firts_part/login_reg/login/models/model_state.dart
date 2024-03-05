class ModelStateLogin{
bool boolGetData;
String message;
String txtError;

ModelStateLogin({required this.boolGetData, required this.message, required this.txtError});
ModelStateLogin copyWith({
  required bool boolGetData1,
  required String message1,
  required String txtError1,
}) {
  return ModelStateLogin(
    boolGetData: boolGetData1,
    txtError: txtError1,
    message: message1,
  );
}

factory ModelStateLogin.fromJson(Map<String, dynamic> json) {
return ModelStateLogin(
boolGetData: json["boolGetData"],
txtError: json["txtError"],
  message: json["message"],
);
}
}




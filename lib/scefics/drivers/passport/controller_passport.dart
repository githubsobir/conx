import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:conx/scefics/drivers/driver_registration/driver_license/driver_license.dart';
import 'package:conx/scefics/drivers/passport/model/model_pasport.dart';
import 'package:conx/scefics/drivers/passport/model/model_pasport_response.dart';
import 'package:conx/widgets/main_url.dart';
import 'package:conx/widgets/saved_box.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final passportWindowID = StateProvider<int>((ref) => 0);

final controllerPassport =
    StateNotifierProvider<ControllerPassport, ModelPassport>(
        (ref) => ControllerPassport());

class ControllerPassport extends StateNotifier<ModelPassport> {
  ControllerPassport()
      : super(ModelPassport(
            boolGetData: true, message: "", errorMessage: "", list: []));

  late Dio dio = Dio();
  var box = HiveBoxes();

  List<File> imageList = [];
  late File file1;
  late File file2;
  late File file3;

  Future getImage(int index) async {
    state = state.copyWith(
        boolGetData1: false, message1: "", errorMessage1: "", list: []);
    final imagePicker = ImagePicker();

    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if(index == 0) {
      file1 = File(pickedFile!.path);
    }else if(index == 1){
      file2 = File(pickedFile!.path);
    }else if(index == 2){
      file3 = File(pickedFile!.path);
    }

    state = state.copyWith(
        boolGetData1: true, list: imageList, message1: "", errorMessage1: "");
  }

  Future getImageCamera(int index) async {
    state = state.copyWith(
        boolGetData1: false, list: imageList, message1: "", errorMessage1: "");
    final imagePicker = ImagePicker();

    final pickedFile = await imagePicker.pickImage(source: ImageSource.camera);

    try{
      if (index == 0) {
        file1 = File(pickedFile!.path);
      } else if (index == 1) {
        file2 = File(pickedFile!.path);
      } else if (index == 2) {
        file3 = File(pickedFile!.path);
      }
    }catch(e){}
    state = state.copyWith(
        boolGetData1: true, list: imageList, message1: "", errorMessage1: "");
  }

  Future getPassportData() async {
    try {
      Response response = await dio.get(
          "${MainUrl.urlMain}/api/driver/passport/",
          options:
              Options(headers: {"Authorization": "Bearer ${box.userToken}"}));
    } catch (e) {}
  }

  Future sentServer({required BuildContext context, required String serNum}) async {
    try {

      state = state.copyWith(boolGetData1: false, message1:"", list: [], errorMessage1: "");
      FormData formData = FormData.fromMap({
        "seria_num": serNum,
        "front_side": await MultipartFile.fromFile(file1.path,
            filename: "front_side"),
        "with_residence": await MultipartFile.fromFile(file2.path,
            filename: "with_residence"),
        "face_img": await MultipartFile.fromFile(file3.path,
            filename: "face_img"),
      });
      Response response = await dio.post(
          "${MainUrl.urlMain}/api/driver/passport/",
          data: formData,
          options:
              Options(headers: {"Authorization": "Bearer ${box.userToken}"}));
      state = state.copyWith(boolGetData1: true, message1:"111", list: [], errorMessage1: "");
      Navigator.push(context, CupertinoPageRoute(builder: (context) => const DriverLicense(),));
      log(jsonEncode(response.data).toString());
      ModelPassportFile modelPassportFile =
          ModelPassportFile.fromJson(response.data);
      log(modelPassportFile.faceImg);
      log(modelPassportFile.frontSide);
      log(modelPassportFile.withResidence);
      log(modelPassportFile.seriaNum);

    } on DioException catch (e) {
      state = state.copyWith(boolGetData1: true, message1:"111", list: [], errorMessage1: "");

      try{
        FormData formData = FormData.fromMap({
          "seria_num": "A1234567",
          "front_side":
              await MultipartFile.fromFile(file1.path, filename: "front_side"),
          "with_residence": await MultipartFile.fromFile(file2.path,
              filename: "with_residence"),
          "face_img":
              await MultipartFile.fromFile(file3.path, filename: "face_img"),
        });
        Response response = await dio.patch(
            "${MainUrl.urlMain}/api/driver/passport/",
            data: formData,
            options:
                Options(headers: {"Authorization": "Bearer ${box.userToken}"}));
        log(jsonEncode(response.data).toString());
        log(e.toString());
      }catch(e){}
      Navigator.push(context, CupertinoPageRoute(builder: (context) => DriverLicense(),));
      state = state.copyWith(boolGetData1: true, message1:"111", list: [], errorMessage1: "");
    } catch (ee) {
      Navigator.push(context, CupertinoPageRoute(builder: (context) => DriverLicense(),));
      log(ee.toString());
      state = state.copyWith(boolGetData1: true, message1:"111", list: [], errorMessage1: "");
    }

    // state = state.copyWith(boolGetData1: true, message1:"111", list: [], errorMessage1: "");
  }

  setDeafault() async{
    state = state.copyWith(
        boolGetData1: false, message1: '', list: [], errorMessage1: "");
    await Future.delayed(const Duration(milliseconds: 100));
    state = state.copyWith(
        boolGetData1: true, message1: '', list: [], errorMessage1: "");
  }
}

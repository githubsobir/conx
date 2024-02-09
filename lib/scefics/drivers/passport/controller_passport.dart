import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:conx/scefics/drivers/passport/model/model_pasport.dart';
import 'package:conx/scefics/drivers/passport/model/model_pasport_response.dart';
import 'package:conx/widgets/main_url.dart';
import 'package:conx/widgets/saved_box.dart';
import 'package:dio/dio.dart';
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

  Future getImage(int index) async {
    state = state.copyWith(
        boolGetData1: false, message1: "", errorMessage1: "", list: []);
    final imagePicker = ImagePicker();

    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    imageList.add(File(pickedFile!.path));

    if (imageList.isNotEmpty) {
      for (int i = 0; i < imageList.length;) {
        if (index == 0) {
          imageList[index] = File(pickedFile.path);
        } else if (index == 1) {
          imageList[index] = File(pickedFile.path);
        } else if (index == 2) {
          imageList[index] = File(pickedFile.path);
        }
        break;
      }
    }
    state = state.copyWith(
        boolGetData1: true, list: imageList, message1: "", errorMessage1: "");
  }

  Future getImageCamera(int index) async {
    state = state.copyWith(
        boolGetData1: true, list: imageList, message1: "", errorMessage1: "");
    final imagePicker = ImagePicker();

    final pickedFile = await imagePicker.pickImage(source: ImageSource.camera);
    imageList.add(File(pickedFile!.path));
    if (imageList.isNotEmpty) {
      for (int i = 0; i < imageList.length;) {
        if (index == 0) {
          imageList[index] = File(pickedFile.path);
        } else if (index == 1) {
          imageList[index] = File(pickedFile.path);
        } else if (index == 2) {
          imageList[index] = File(pickedFile.path);
        }
        break;
      }
    }
    state = state.copyWith(
        boolGetData1: true, list: imageList, message1: "", errorMessage1: "");
  }


  Future getPassportData()async{
    try{
      Response response = await dio.get("${MainUrl.urlMain}/api/driver/passport/",
          options:
          Options(headers: {"Authorization": "Bearer ${box.userToken}"})
      );
    }catch(e){}
  }

  Future sentServer() async {
    try {
      FormData formData = FormData.fromMap({
        "seria_num": "A1234567",
        "front_side": await MultipartFile.fromFile(imageList[0].path,
            filename: "front_side"),
        "with_residence": await MultipartFile.fromFile(imageList[1].path,
            filename: "with_residence"),
        "face_img": await MultipartFile.fromFile(imageList[2].path,
            filename: "face_img"),
      });
      Response response = await dio.post(
          "${MainUrl.urlMain}/api/driver/passport/",
          data: formData,
          options:
              Options(headers: {"Authorization": "Bearer ${box.userToken}"}));
      log(jsonEncode(response.data).toString());
      ModelPassportFile modelPassportFile =
          ModelPassportFile.fromJson(response.data);
      log(modelPassportFile.faceImg);
      log(modelPassportFile.frontSide);
      log(modelPassportFile.withResidence);
      log(modelPassportFile.seriaNum);
    } on DioException catch (e) {
      log(e.toString());
    } catch (ee) {
      log(ee.toString());
    }
  }
}

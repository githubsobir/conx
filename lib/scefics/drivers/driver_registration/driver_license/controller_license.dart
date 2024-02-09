import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:conx/scefics/drivers/driver_registration/driver_license/model/model_license.dart';
import 'package:conx/widgets/main_url.dart';
import 'package:conx/widgets/saved_box.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final controllerDriverLicense =
    StateNotifierProvider<ControllerLicense, ModelLicense>(
        (ref) => ControllerLicense());

class ControllerLicense extends StateNotifier<ModelLicense> {
  ControllerLicense()
      : super(ModelLicense(
            boolGetData: true, message: "", list: [], errorMessage: ""));

  var dio = Dio();
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

  Future getDriverLicense() async {
    try {
      state = state.copyWith(
          boolGetData1: false, message1: "", list: [], errorMessage1: "");

      Response response = await dio.post("path",
          options:
              Options(headers: {"Authorization": "Bearer ${box.userToken}"}));
      //state = state.copyWith(boolGetData1: true, message1: "", list: [], errorMessage1: "");
    } on DioException catch (e) {
    } catch (ee) {}
  }

  Future setDriverLicense() async {
    log(imageList.length.toString());

    try {
      FormData formData = FormData.fromMap({
        "license_seria_num": "AA1234567",
        "license_expiration_date":"2022-12-12",
        "front_side": await MultipartFile.fromFile(
            imageList[0].path,
            filename: "license_expiration_date"),
        "back_side": await MultipartFile.fromFile(imageList[1].path,
            filename: "front_side"),
        "face_img": await MultipartFile.fromFile(imageList[2].path,
            filename: "face_img"),
      });
      Response response = await dio.post(
          "${MainUrl.urlMain}/api/driver/license/",
          data: formData,
          options:
              Options(headers: {"Authorization": "Bearer ${box.userToken}"}));
      log(jsonEncode(response.data).toString());
    } on DioException catch (e) {
      log(e.toString());
    } catch (ee) {
      log(ee.toString());
    }
  }

  Future updateDriverLicense() async {
    try {
      Response response = await dio.post("path",
          options:
              Options(headers: {"Authorization": "Bearer ${box.userToken}"}));
    } on DioException catch (e) {
    } catch (ee) {}
  }
}

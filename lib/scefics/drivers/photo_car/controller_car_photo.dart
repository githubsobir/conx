import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:conx/scefics/drivers/photo_car/model_photo_car/model_controller_car_photo.dart';
import 'package:conx/widgets/main_url.dart';
import 'package:conx/widgets/saved_box.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final controllerCarPhoto6 = StateNotifierProvider.autoDispose<
    ControllerCarPhoto6, ModelControllerPhoto>((ref) => ControllerCarPhoto6());

class ControllerCarPhoto6 extends StateNotifier<ModelControllerPhoto> {
  ControllerCarPhoto6()
      : super(ModelControllerPhoto(
            boolGetData: true, message: "", errorMessage: ""));

  var box = HiveBoxes();
  var dio = Dio();

  late File file1;
  late File file2;
  late File file3;
  late File file4;
  late File file5;

  Future getImage(int index) async {
    state = state.copyWith(
      boolGetData1: false,
      message1: "",
      errorMessage1: "",
    );
    final imagePicker = ImagePicker();

    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (index == 0) {
      file1 = File(pickedFile!.path);
    } else if (index == 1) {
      file2 = File(pickedFile!.path);
    } else if (index == 2) {
      file3 = File(pickedFile!.path);
    } else if (index == 3) {
      file4 = File(pickedFile!.path);
    } else if (index == 4) {
      file5 = File(pickedFile!.path);
    }

    state = state.copyWith(boolGetData1: true, message1: "", errorMessage1: "");
  }

  Future getImageCamera(int index) async {
    state =
        state.copyWith(boolGetData1: false, message1: "", errorMessage1: "");
    final imagePicker = ImagePicker();

    final pickedFile = await imagePicker.pickImage(source: ImageSource.camera);
    try {
      if (index == 0) {
        file1 = File(pickedFile!.path);
      } else if (index == 1) {
        file2 = File(pickedFile!.path);
      } else if (index == 2) {
        file3 = File(pickedFile!.path);
      } else if (index == 3) {
        file4 = File(pickedFile!.path);
      } else if (index == 4) {
        file5 = File(pickedFile!.path);
      }
    } catch (e) {}
    state = state.copyWith(boolGetData1: true, message1: "", errorMessage1: "");
  }

  Future setData() async {
    try {
      FormData formData = FormData.fromMap({
        "transport_front":
            await MultipartFile.fromFile(file1.path, filename: "img1"),
        "transport_left":
            await MultipartFile.fromFile(file2.path, filename: "img2"),
        "transport_behind":
            await MultipartFile.fromFile(file3.path, filename: "img3"),
        "transport_right":
            await MultipartFile.fromFile(file4.path, filename: "img4"),
        "row_seats": await MultipartFile.fromFile(file5.path, filename: "img5"),
        "baggage": await MultipartFile.fromFile(file5.path, filename: "img5"),
      });

      state =
          state.copyWith(boolGetData1: false, message1: "", errorMessage1: "");
      Response response = await dio.post("${MainUrl.urlMain}/api/driver/transport-image/",
          data: formData,
          options:
              Options(headers: {"Authorization": "Bearer ${box.userToken}"}));
      log(jsonEncode(response.data).toString());
      state =
          state.copyWith(boolGetData1: true, message1: "", errorMessage1: "");
    } on DioException catch (ee) {
      log(ee.toString());
      state =
          state.copyWith(boolGetData1: true, message1: "", errorMessage1: "");
    } catch (e) {
      log(e.toString());
      state =
          state.copyWith(boolGetData1: true, message1: "", errorMessage1: "");
    }
  }

  setDefault() async {
    state =
        state.copyWith(boolGetData1: false, message1: '', errorMessage1: "");
    await Future.delayed(const Duration(milliseconds: 100));
    state = state.copyWith(boolGetData1: true, message1: '', errorMessage1: "");
  }
}

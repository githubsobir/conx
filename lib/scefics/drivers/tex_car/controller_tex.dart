import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:conx/firts_part/login_reg/reg/model_reg.dart';
import 'package:conx/scefics/drivers/tex_car/model_tex_car/model_tex_car_controller.dart';
import 'package:conx/widgets/main_url.dart';
import 'package:conx/widgets/saved_box.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final controllerTexCar =
    StateNotifierProvider.autoDispose<ControllerTexCar, ModelCarTextController>(
        (ref) => ControllerTexCar());

class ControllerTexCar extends StateNotifier<ModelCarTextController> {
  ControllerTexCar()
      : super(ModelCarTextController(boolGetData: true, txtError: "")){
    getRegion();
  }
  var dio = Dio();
  var box = HiveBoxes();

  List<ModelRegCountry> listModelCountry = [];

  Future getRegion() async {
    try {
      state = state.copyWith(boolGetData1: false, txtError1: "");
      Response data =
          await dio.get("${MainUrl.urlMain}/api/auth/country-list/");
      log(jsonEncode(data.data).toString());
      listModelCountry
          .addAll((data.data as List).map((e) => ModelRegCountry.fromJson(e)));

      state = state.copyWith(boolGetData1: true, txtError1: "");
    } on DioException catch (e) {
      state = state.copyWith(boolGetData1: true, txtError1: e.toString());
      log(e.toString());
    }
  }

  late File file1;
  late File file2;

  Future getImage(int index) async {
    state = state.copyWith(
        boolGetData1: false, txtError1: "");
    final imagePicker = ImagePicker();

    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);

    if (index == 0) {
      file1 = File(pickedFile!.path);
    }

    if (index == 1) {
      file2 = File(pickedFile!.path);
    }


    state = state.copyWith(
        boolGetData1: true, txtError1: "");
  }

  Future getImageCamera(int index) async {
    state = state.copyWith(
        boolGetData1: false,txtError1: "");
    final imagePicker = ImagePicker();

    final pickedFile = await imagePicker.pickImage(source: ImageSource.camera);

    if (index == 0) {
      file1 = File(pickedFile!.path);
    }

    if (index == 1) {
      file2 = File(pickedFile!.path);
    }
    state = state.copyWith(
        boolGetData1: true, txtError1: "");
  }


  Future setTexCarServer({required String country1, required String serNum})async{
    try{

      state = state.copyWith(boolGetData1: false, txtError1: "");
      FormData formData = FormData.fromMap({
        "country": country1,
        "serial_number":serNum,
        "front_side_img": await MultipartFile.fromFile(file1.path,
            filename: "license_expiration_date"),
        "back_side_img": await MultipartFile.fromFile(file2.path,
            filename: "front_side")
      });

      log(box.userToken);
      log(country1);




      Response response = await dio.post("${MainUrl.urlMain}/api/driver/technical-passport/",
      options: Options(headers: {"Authorization":"Bearer ${box.userToken}"}),
        data: formData
      );
      log(jsonEncode(response.data).toString());
      state = state.copyWith(boolGetData1: true, txtError1: "");
    }
    on DioException catch(ee){
      log(ee.toString());
      state = state.copyWith(boolGetData1: true, txtError1: ee.toString());
    }
    catch(e){
      log(e.toString());
      state = state.copyWith(boolGetData1: true, txtError1: e.toString());
    }
  }
}

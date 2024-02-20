import 'dart:convert';
import 'dart:developer';

import 'package:conx/scefics/drivers/driver_registration/model_check_user_info/model_check_user_info.dart';
import 'package:conx/scefics/drivers/driver_registration/model_driver_reg.dart';
import 'package:conx/widgets/main_url.dart';
import 'package:conx/widgets/saved_box.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final controllerDriverReg =
    StateNotifierProvider<ControllerDriverReg, ModelControllerDriverReg>(
        (ref) => ControllerDriverReg());

class ControllerDriverReg extends StateNotifier<ModelControllerDriverReg> {
  ControllerDriverReg()
      : super(ModelControllerDriverReg(
            boolGetData: true,
            message: "",
            list: ["0", "0", "0", "0", "0", "0", "0"],
            errorMessage: "")) {
    checkerUserAllData(index: 0, value: "0");
    checkUserAllData();
  }

  var dio = Dio();
  var box = HiveBoxes();

  List<String> list1 = ["0", "0", "0", "0", "0", "0", "0"];

  Future checkerUserAllData({required int index, required String value}) async {
    try {
      list1[index] = value;
      state = state.copyWith(
          boolGetData1: true, message1: "", list: list1, errorMessage1: "");

      /// model ga olib state ga berish kerak
    } on DioException catch (ee) {
      log(ee.toString());
    } catch (e) {
      log(e.toString());
    }
  }

  Future checkUserAllData() async {
    try {
      state = state.copyWith(
          boolGetData1: false, message1: "", list: list1, errorMessage1: "");
      Response response = await dio.get(
          "${MainUrl.urlMain}/api/driver/check-online-register/",
          options:
              Options(headers: {"Authorization": "Bearer ${box.userToken}"}));
      ModelCheckUserInfo modelCheckUserInfo =
          ModelCheckUserInfo.fromJson(response.data);
      log(jsonEncode(response.data).toString());
     list1[0] = modelCheckUserInfo.passport?"1":"0";
     list1[1] = modelCheckUserInfo.license?"1":"0";
     list1[2] = modelCheckUserInfo.company?"1":"0";
     list1[3] = modelCheckUserInfo.payment?"1":"0";
     list1[4] = modelCheckUserInfo.transportDetail?"1":"0";
     list1[5] = modelCheckUserInfo.techPassport?"1":"0";
      list1[6] = modelCheckUserInfo.images?"1":"0";
      state = state.copyWith(
          boolGetData1: true, message1: "", list: list1, errorMessage1: "");
    } on DioException catch (e) {
      log(e.toString());
      state = state.copyWith(
          boolGetData1: true,
          message1: "",
          list: list1,
          errorMessage1: e.toString());
    } catch (ee) {
      log(ee.toString());
      state = state.copyWith(
          boolGetData1: false,
          message1: "",
          list: list1,
          errorMessage1: ee.toString());
    }
  }
}

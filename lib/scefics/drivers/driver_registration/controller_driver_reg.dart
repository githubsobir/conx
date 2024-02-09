import 'dart:developer';

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
  }

  var dio = Dio();
  var box = HiveBoxes();

  /// user get ma'lumotlari
  Future getUserAllData() async {
    try {
      Response response = await dio.get("${MainUrl.urlMain}url",
          options:
              Options(headers: {"Authorization": "Bearer ${box.userToken}"}));

      /// model ga olib state ga berish kerak
    } on DioException catch (ee) {
      log(ee.toString());
    } catch (e) {
      log(e.toString());
    }
  }

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
}

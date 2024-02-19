import 'dart:convert';
import 'dart:developer';

import 'package:conx/scefics/drivers/choose_rate/choose_rate.dart';
import 'package:conx/scefics/drivers/driver_registration/driver_choose_company/model/model_choose_company.dart';
import 'package:conx/scefics/drivers/driver_registration/driver_choose_company/model/model_controller.dart';
import 'package:conx/widgets/main_url.dart';
import 'package:conx/widgets/saved_box.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final controllerDriverChooseLogComp =
    StateNotifierProvider<ControllerChooseCompany, ModelControllerCompany>(
        (ref) => ControllerChooseCompany());

class ControllerChooseCompany extends StateNotifier<ModelControllerCompany> {
  ControllerChooseCompany()
      : super(ModelControllerCompany(
            boolGetData: true, message: "", errorMessage: "")) {
    getData();
  }

  var dio = Dio();
  var box = HiveBoxes();
  List<MadelLogisticCompany> listCompany = [];

  Future getData() async {
    try {
      state =
          state.copyWith(boolGetData1: false, message1: "", errorMessage1: "");
      Response response =
          await dio.get("${MainUrl.urlMain}/api/logistic/companies/");
      listCompany = (response.data as List)
          .map((e) => MadelLogisticCompany.fromJson(e))
          .toList();

      state =
          state.copyWith(boolGetData1: true, message1: "", errorMessage1: "");
    } catch (e) {}
  }

  Future setCompany({required String driverCompany, required BuildContext context}) async {
    try {
      log(driverCompany);
      FormData formData = FormData.fromMap({"company_name": driverCompany});
      state =
          state.copyWith(boolGetData1: false, message1: "", errorMessage1: "");
      Response response = await dio.post(
          "${MainUrl.urlMain}/api/driver/company/",
          options:
              Options(headers: {"Authorization": "Bearer ${box.userToken}"}),
          data: formData);
      log(jsonEncode(response.data).toString());


      state =
          state.copyWith(boolGetData1: true, message1: "", errorMessage1: "");
    } on DioException catch (e) {
      log(e.toString());
      state = state.copyWith(
          boolGetData1: true,
          message1: e.toString(),
          errorMessage1: e.toString());
    } catch (ee) {
      log(ee.toString());
      state = state.copyWith(
          boolGetData1: true,
          message1: ee.toString(),
          errorMessage1: ee.toString());
    }
  }
}

import 'dart:convert';
import 'dart:developer';

import 'package:conx/scefics/drivers/choose_rate/model_payment/model_payment_controller.dart';
import 'package:conx/widgets/main_url.dart';
import 'package:conx/widgets/saved_box.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final controllerPayment =
    StateNotifierProvider<ControllerPayment, ModelPayment>(
        (ref) => ControllerPayment());

class ControllerPayment extends StateNotifier<ModelPayment> {
  ControllerPayment()
      : super(ModelPayment(boolGetData: true, message: "", errorMessage: ""));

  var dio = Dio();
  var box = HiveBoxes();

  Future setData({required int index}) async {
    try {
      List<String> list = ["Cash", "Card", "Transfer"];

      state =
          state.copyWith(boolGetData1: false, message1: "", errorMessage1: "");
      FormData formData = FormData.fromMap({"payment_type": list[index]});
      Response response = await dio.post(
          "${MainUrl.urlMain}/api/driver/payment-type/",
          data: formData,
          options:
              Options(headers: {"Authorization": "Bearer ${box.userToken}"}));

      log(jsonEncode(response.data).toString());
      state =
          state.copyWith(boolGetData1: true, message1: "", errorMessage1: "");
    } on DioException catch (e) {
      log(e.toString());
      state = state.copyWith(
          boolGetData1: true,
          message1: e.toString(),
          errorMessage1: e.toString());
    } catch (e1) {
      log(e1.toString());
      state = state.copyWith(
          boolGetData1: true,
          message1: e1.toString(),
          errorMessage1: e1.toString());
    }
  }
}

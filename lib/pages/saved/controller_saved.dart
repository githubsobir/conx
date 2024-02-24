import 'dart:convert';
import 'dart:developer';

import 'package:conx/pages/saved/model_saved/model_saved_controller.dart';
import 'package:conx/widgets/main_url.dart';
import 'package:conx/widgets/saved_box.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final controllerSaved =
    StateNotifierProvider.autoDispose<ControllerSaved, ModelSavedController>(
        (ref) => ControllerSaved());

class ControllerSaved extends StateNotifier<ModelSavedController> {
  ControllerSaved()
      : super(ModelSavedController(
            boolGetData: true, message: "", errorMessage: "")) {
    getData();
  }

  var box = HiveBoxes();
  var dio = Dio();

  Future getData() async {
    try {
      log(box.userToken);
      Response response = await dio.get(
          "${MainUrl.urlMain}/api/driver-driver_main/wish-list/",
          options:
              Options(headers: {"Authorization": "Bearer ${box.userToken}"}));

      log("jsonEncode(response.data).toString()");
      log(jsonEncode(response.data).toString());
    } on DioException catch (e) {}
  }
}

import 'dart:convert';
import 'dart:developer';

import 'package:conx/scefics/drivers/cargo_transport/car_ton_weight/model_car_weight_volume/model_car_weight_volume.dart';
import 'package:conx/widgets/main_url.dart';
import 'package:conx/widgets/saved_box.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final controllerCarWeightAndVolume = StateNotifierProvider.autoDispose<
    ControllerCarWeightAndVolume,
    ModelCarWeightVolumeController>((ref) => ControllerCarWeightAndVolume());

class ControllerCarWeightAndVolume
    extends StateNotifier<ModelCarWeightVolumeController> {
  ControllerCarWeightAndVolume()
      : super(ModelCarWeightVolumeController(
            boolGetData: true, message: "", errorMessage: ""));

  var dio = Dio();
  var box = HiveBoxes();

  Future setData({required BuildContext context} ) async {
    try {
      FormData formData = FormData.fromMap({
        "transport_type": box.modelTransport,
        "model_transport": box.modelManufacturer,
        "color_transport": box.modelCarColor,
        "transport_made_date": box.modelCarYear,
        "tons_from": box.modelCarTonsFrom,
        "tons_to": box.modelCarTonsTo
      });

      log(box.modelTransport.toString());
      log(box.modelManufacturer.toString());
      log(box.modelCarColor.toString());
      log(box.modelCarYear.toString());
      log(box.modelCarTonsFrom.toString());
      log(box.modelCarTonsTo.toString());

      Response response = await dio.post(
          "${MainUrl.urlMain}/api/driver/transport-details/",
          data: formData,
          options:
              Options(headers: {"Authorization": "Bearer ${box.userToken}"}));
      log(jsonEncode(response.data).toString());
    } catch (e) {
      log(e.toString());
    }
  }
}

import 'dart:convert';
import 'dart:developer';

import 'package:conx/scefics/drivers/cargo_transport/controller_manufactory/model_manufactory/model_controller_manifatory.dart';
import 'package:conx/scefics/drivers/cargo_transport/controller_manufactory/model_manufactory/model_manufacturers.dart';
import 'package:conx/widgets/main_url.dart';
import 'package:conx/widgets/saved_box.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final controllerManufacturers = StateNotifierProvider.autoDispose<ControllerManufacturers,
    ModelControllerManufacturers>((ref) => ControllerManufacturers());

class ControllerManufacturers
    extends StateNotifier<ModelControllerManufacturers> {
  ControllerManufacturers()
      : super(ModelControllerManufacturers(
            boolGetData: true, message: "", errorMessage: "")){
    getData();
  }

  var dio = Dio();
  var box = HiveBoxes();
  List<MadelManufacturers> listManufacturers = [];

  Future getData() async {
    try {
      state =
          state.copyWith(boolGetData1: false, message1: "", errorMessage1: "");
log("#&&&");
      Response response =
          await dio.get("${MainUrl.urlMain}/api/driver/manufacturers/");
      listManufacturers = (response.data as List)
          .map((e) => MadelManufacturers.fromJson(e))
          .toList();
      log(jsonEncode(response.data).toString());
      state =
          state.copyWith(boolGetData1: true, message1: "", errorMessage1: "");
    } on DioException catch (ee) {
      log(ee.toString());
      state = state.copyWith(
          boolGetData1: true,
          message1: ee.toString(),
          errorMessage1: ee.toString());
    } catch (e) {
      log(e.toString());
      state = state.copyWith(
          boolGetData1: true,
          message1: e.toString(),
          errorMessage1: e.toString());
    }
  }
}

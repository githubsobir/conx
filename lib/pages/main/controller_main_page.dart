import 'dart:convert';
import 'dart:developer';

import 'package:conx/pages/main/models/model_cities.dart';
import 'package:conx/pages/main/models/model_main.dart';
import 'package:conx/pages/main/models/model_main_page_controller.dart';
import 'package:conx/widgets/main_url.dart';
import 'package:conx/widgets/saved_box.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final controllerMainPage = StateNotifierProvider.autoDispose<ControllerMainPage,
    ModelControllerMainPage>((ref) => ControllerMainPage());



final controllerMainPageCity1Name = StateProvider((ref) => "");
final controllerMainPageCity1Id = StateProvider((ref) => "");
final controllerMainPageCity2Name = StateProvider((ref) => "");
final controllerMainPageCity2Id = StateProvider((ref) => "");


class ControllerMainPage extends StateNotifier<ModelControllerMainPage> {
  ControllerMainPage()
      : super(ModelControllerMainPage(
            boolGetData: false, message: "", errorMessage: "")){
    getLocation();
  }

  var dio = Dio();
  var box = HiveBoxes();
  List<ModelMainPage> listMainPage = [];

  Future getMainPageData() async {
    try {
      state =
          state.copyWith(boolGetData1: false, message1: "", errorMessage1: "");

      Response response = await dio.get(
          box.userType == "1"
              ? "${MainUrl.urlMain}/api/client/order-list/"
              : "${MainUrl.urlMain}/api/client/order-list/",
          options:
              Options(headers: {"Authorization": "Bearer ${box.userToken}"}));
      log(jsonEncode(response.data).toString());
      listMainPage = (response.data as List)
          .map((e) => ModelMainPage.fromJson(e))
          .toList();
      state =
          state.copyWith(boolGetData1: true, message1: "", errorMessage1: "");
    } on DioException catch (ee) {
      state = state.copyWith(
          boolGetData1: true,
          message1: ee.toString(),
          errorMessage1: ee.toString());
    } catch (e) {}
  }

  List<ModelGetCities> listCities = [];

  Future getLocation() async {
    try {
      state =
          state.copyWith(boolGetData1: false, message1: "", errorMessage1: "");

      Response response =
          await dio.get("${MainUrl.urlMain}/api/auth/direction-list/");
      log(jsonEncode(response.data));
      listCities = (response.data as List)
          .map((e) => ModelGetCities.fromJson(e))
          .toList();
      state =
          state.copyWith(boolGetData1: true, message1: "", errorMessage1: "");
    } catch (e) {
      log(e.toString());
      // state = state.copyWith(
      //     boolGetData1: true,
      //     message1: e.toString(),
      //     errorMessage1: e.toString());
    }
  }
}

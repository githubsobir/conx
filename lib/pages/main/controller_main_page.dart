import 'dart:convert';
import 'dart:developer';

import 'package:conx/pages/main/models/model_cities.dart';
import 'package:conx/pages/main/models/model_for_images.dart';
import 'package:conx/pages/main/models/model_main.dart';
import 'package:conx/pages/main/models/model_main_page_controller.dart';
import 'package:conx/widgets/main_url.dart';
import 'package:conx/widgets/saved_box.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final controllerSearchOpen = StateProvider<bool>((ref) => false);

final controllerMainPage = StateNotifierProvider.autoDispose<ControllerMainPage,
    ModelControllerMainPage>((ref) => ControllerMainPage());

final controllerMainPageCity1Name = StateProvider((ref) => "");
final controllerMainPageCity1Id = StateProvider((ref) => "");
final controllerMainPageCity2Name = StateProvider((ref) => "");
final controllerMainPageCity2Id = StateProvider((ref) => "");

class ControllerMainPage extends StateNotifier<ModelControllerMainPage> {
  ControllerMainPage()
      : super(ModelControllerMainPage(
            boolGetData: false, message: "", errorMessage: "")) {
    getMainPageData();
  }

  var dio = Dio();
  var box = HiveBoxes();
  List<ModelOrderList> listMainPage = [];

  List<ModelOrderImagesList> listImages = [];

  Future getMainPageData() async {
    try {
      state =
          state.copyWith(boolGetData1: false, message1: "", errorMessage1: "");
      listMainPage.clear();
      Response response = await dio.get(
          "${MainUrl.urlMain}/api/client/order-list/",
          options:
              Options(headers: {"Authorization": "Bearer ${box.userToken}"}));
      log(jsonEncode(response.data).toString());
      listMainPage = (response.data as List)
          .map((e) => ModelOrderList.fromJson(e))
          .toList();
      log("1");
      for (int i = 0; i < listMainPage.length; i++) {
        listImages.add(ModelOrderImagesList(idItem: i.toString(), image: []));
        log("2");
        if (listMainPage[i].file1.toString() != "null") {
          listImages[i].image.add(listMainPage[i].file1.toString());
        }
        if (listMainPage[i].file2.toString() != "null") {
          listImages[i].image.add(listMainPage[i].file2.toString());
        }
        if (listMainPage[i].file3.toString() != "null") {
          listImages[i].image.add(listMainPage[i].file3.toString());
        }
        if (listMainPage[i].file4.toString() != "null") {
          listImages[i].image.add(listMainPage[i].file4.toString());
        }
        if (listMainPage[i].file5.toString() != "null") {
          listImages[i].image.add(listMainPage[i].file5.toString());
        }
        if (listMainPage[i].file6.toString() != "null") {
          listImages[i].image.add(listMainPage[i].file6.toString());
        }
        log("3");
      }
      log(jsonEncode(listImages).toString());

      // serverdan file list qilib kelaydigan qilish kerak.

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

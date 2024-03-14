import 'dart:convert';
import 'dart:developer';

import 'package:conx/data/models/model_country_list.dart';
import 'package:conx/pages/search/model_search/model_for_search.dart';
import 'package:conx/pages/search/model_search/model_seach_controller.dart';
import 'package:conx/pages/search/model_search/model_search_controller.dart';
import 'package:conx/widgets/main_url.dart';
import 'package:conx/widgets/saved_box.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final controllerSearchDetails =
    StateNotifierProvider<ControllerSearchDetails, ModelSearchController>(
        (ref) => ControllerSearchDetails());

class ControllerSearchDetails extends StateNotifier<ModelSearchController> {
  ControllerSearchDetails()
      : super(ModelSearchController(
            boolGetData: true, message: "", errorMessage: ""));

  final _box = HiveBoxes();
  final _dio = Dio();

  Future getData({required ModelOrderList99 m1}) async {
    try {
      Response response = await _dio
          .get("${MainUrl.urlMain}/${SearchWithModel.getLinkSearch(m: m1)}");
      log(jsonEncode(response.data).toString());
    } catch (e) {
      log(e.toString());
    }
  }

  List<ModelCountryList> listCountry = [];

  Future getRegion() async {
    try {
      state =
          state.copyWith(boolGetData1: false, message1: "", errorMessage1: "");

      log("#333");
      Response response =
          await _dio.get("${MainUrl.urlMain}/api/auth/country-list/");
      listCountry = (response.data as List)
          .map((e) => ModelCountryList.fromJson(e))
          .toList();
      state =
          state.copyWith(boolGetData1: true, message1: "", errorMessage1: "");
    } catch (e) {
      log(e.toString());
    }
  }

  String regionName1 = "";
  String regionId1 = "";
  String regionId2 = "";
  String regionName2 = "";

  setRegion(
      {required int index,
      required String regName,
      required String regionId}) {
    state = state.copyWith(boolGetData1: false, message1: "", errorMessage1: "");
    if(index == 1){
      regionName1 = regName;
      regionId1 = regionId;
    }else if(index == 2){
      regionName2 = regName;
      regionId2 = regionId;
    }
    state = state.copyWith(boolGetData1: true, message1: "", errorMessage1: "");
  }
}

import 'dart:convert';
import 'dart:developer';

import 'package:conx/pages/search/model_search/model_for_search.dart';
import 'package:conx/pages/search/model_search/model_seach_controller.dart';
import 'package:conx/pages/search/model_search/model_search_controller.dart';
import 'package:conx/widgets/main_url.dart';
import 'package:conx/widgets/saved_box.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final controllerSearchDetails = StateNotifierProvider<ControllerSearchDetails, ModelSearchController>((ref) => ControllerSearchDetails());

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
    } catch (e) {}
  }
}

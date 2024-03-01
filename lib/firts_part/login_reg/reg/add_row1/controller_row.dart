import 'dart:convert';
import 'dart:developer';

import 'package:conx/firts_part/login_reg/reg/add_row1/model_row/model_rergion.dart';
import 'package:conx/firts_part/login_reg/reg/add_row1/model_row/model_row_1.dart';
import 'package:conx/scefics/drivers/driver_registration/driver_reg.dart';
import 'package:conx/widgets/main_url.dart';
import 'package:conx/widgets/saved_box.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final controllerFirstRowName = StateProvider<String>((ref) => "");
final controllerSecondRowName = StateProvider<String>((ref) => "");

final controllerRowChooseFirstTime = StateNotifierProvider.autoDispose<
    ControllerChooseDirectionClass,
    ModelRow1Choose>((ref) => ControllerChooseDirectionClass());

class ControllerChooseDirectionClass extends StateNotifier<ModelRow1Choose> {
  ControllerChooseDirectionClass()
      : super(ModelRow1Choose(statusData: "1", textError: "", note: "")) {
    getFirstDirection();
  }

  var box = HiveBoxes();
  final _dio = Dio();

  List<ModelRegion> listModelRegion = [];

  Future getFirstDirection() async {
    try {
      state = state.copyWith("0", "", "");
      Response response =
          await _dio.get("${MainUrl.urlMain}/api/auth/country-list/");
      listModelRegion =
          (response.data as List).map((e) => ModelRegion.fromJson(e)).toList();

      state = state.copyWith("1", "", "");
    } on DioException catch (ee) {
      state = state.copyWith("1", ee.toString(), ee.toString());
    } catch (e) {
      state = state.copyWith("1", e.toString(), e.toString());
    }
  }

  String region1Id = "";
  String region2Id = "";
  String region1Name = "";
  String region2Name = "";

  Future setRegion(
      {required String regionId,
      required String reginName,
      required String id}) async {
    state = state.copyWith("0", "", "");
    if (id == "1") {
      region1Id = regionId;
      region1Name = reginName;
    } else if (id == "2") {
      region2Id = regionId;
      region2Name = reginName;
    }
    state = state.copyWith("1", "", "");
  }

  Future setRegionServer({required BuildContext context}) async {
    try {
      FormData formData = FormData.fromMap(
          // {"direction_from": region1Id, "direction_to": region2Id});// ishlaydigani
          {"direction_from": "1", "direction_to": "2"});
      Response response = await _dio.post(
          "${MainUrl.urlMain}/api/driver/direction/",
          data: formData,
          options:
              Options(headers: {"Authorization": "Bearer ${box.userToken}"}));

      Navigator.push(context, CupertinoPageRoute(builder: (context) => DrawerRegistration(),));
      log(jsonEncode(response.data).toString());
    } catch (e) {

      log(box.userToken.toString());
      log(region1Id);
      log(region2Id);
      log(e.toString());
    }
  }
}

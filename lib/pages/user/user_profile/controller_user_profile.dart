import 'dart:convert';
import 'dart:developer';

import 'package:conx/pages/user/user_profile/models/model_controller_user_prifil.dart';
import 'package:conx/pages/user/user_profile/models/model_user_profile.dart';
import 'package:conx/widgets/main_url.dart';
import 'package:conx/widgets/saved_box.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final controllerUserProfile = StateNotifierProvider.autoDispose<
    ControllerUserProfile1,
    ModelControllerUserProfile>((ref) => ControllerUserProfile1());

class ControllerUserProfile1 extends StateNotifier<ModelControllerUserProfile> {
  ControllerUserProfile1()
      : super(ModelControllerUserProfile(
            boolGetData: true, message: "", errorMessage: "")) {
    getData();
  }

  final _dio = Dio();
  final box = HiveBoxes();

  List<ModelGetUserProfile> listProfile = [];
  TextEditingController txt1 = TextEditingController();
  TextEditingController txt2 = TextEditingController();
  TextEditingController txt3 = TextEditingController();
  TextEditingController txt4 = TextEditingController();
  TextEditingController txt5 = TextEditingController();
  String direction1 = "";
  String dateBirth = "";
  String direction2 = "";
  String imageUrl = "";

  Future getData() async {
    try {
      log(box.userToken);
      state =
          state.copyWith(boolGetData1: false, message1: "", errorMessage1: "");
      Response response = await _dio.get(urlProfile(),
          options:
              Options(headers: {"Authorization": "Bearer ${box.userToken}"}));

      listProfile = (response.data as List)
          .map((e) => ModelGetUserProfile.fromJson(e))
          .toList();
      log(jsonEncode(response.data).toString());

      txt1.text = listProfile[0].driverFullName.name.toString();
      txt2.text = listProfile[0].driverFullName.surname.toString();
      txt3.text = listProfile[0].driverFullName.lastName.toString();
      txt4.text = listProfile[0].phone.toString();
      dateBirth = listProfile[0].driverDateBirth.date.toString();
      direction1 = listProfile[0].driverDirection.directionFrom.name.toString();
      direction2 = listProfile[0].driverDirection.directionTo.name.toString();
      txt5.text = listProfile[0].bio.toString() == "null"
          ? ""
          : listProfile[0].bio.toString();
      imageUrl = listProfile[0].driverAvatar.image.toString() == "null"
          ? ""
          :  listProfile[0].driverAvatar.image.toString();

      state =
          state.copyWith(boolGetData1: true, message1: "", errorMessage1: "");
    } on DioException catch (e) {
      state = state.copyWith(
          boolGetData1: true,
          message1: urlProfile(),
          errorMessage1: e.toString());
      log(e.toString());
    }
  }

  setProfileData() {}

  String urlProfile() {
    String url =
        "/api/driver/profile/"; // box.userType == "Driver" ? "/api/driver/profile/" : "";
    return "${MainUrl.urlMain}$url";
  }
}

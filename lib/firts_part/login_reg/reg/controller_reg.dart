import 'dart:developer';

import 'package:conx/firts_part/login_reg/reg/model_reg.dart';
import 'package:conx/firts_part/login_reg/sms/sms_page.dart';
import 'package:conx/widgets/main_url.dart';
import 'package:conx/widgets/saved_box.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedIndex = StateProvider<int>((ref) => 0);

final registrationController =
    StateNotifierProvider<ControllerReg, ModelForRegServer>(
        (ref) => ControllerReg());

class ControllerReg extends StateNotifier<ModelForRegServer> {
  ControllerReg() : super(ModelForRegServer(boolGetData: false, txtError: "")) {
    getRegion();
  }

  var dio = Dio();

  List<ModelRegCountry> listModelCountry = [];
  var box = HiveBoxes();

  Future sentForRegistration({required BuildContext context}) async {
    try {
      state = state.copyWith(boolGetData1: false, txtError1: "");
      FormData formData = FormData.fromMap({"phone": box.userPhone});
      Response response = await dio.post("${MainUrl.urlMain}/api/auth/register/",
      data: formData);
      log(response.data.toString());
      state = state.copyWith(boolGetData1: true, txtError1: "");
      Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => SmsVerificationPage("reg"),
          ));

    } on DioException catch (e) {
      if(e.response!.statusCode.toString() == "404") {
        state = state.copyWith(boolGetData1: true, txtError1: e.toString());
      }else if(e.response!.statusCode.toString() == "400"){
        log(e.toString());
        state = state.copyWith(boolGetData1: true, txtError1: e.error.toString());
      }
      else{
        state = state.copyWith(boolGetData1: true, txtError1: e.toString());
      }
    } catch (ww) {
      print(ww.toString());
    }
  }

  Future getRegion() async {
    try {
      state = state.copyWith(boolGetData1: false, txtError1: "");
      Response data =
          await dio.get("${MainUrl.urlMain}/api/auth/country-list/");
      listModelCountry
          .addAll((data.data as List).map((e) => ModelRegCountry.fromJson(e)));

      state = state.copyWith(boolGetData1: true, txtError1: "");
    } on DioException catch (e) {
      state = state.copyWith(boolGetData1: true, txtError1: e.toString());
      log(e.toString());
    }
  }

  Future setDefault()async{
    state = state.copyWith(boolGetData1: true, txtError1: "");
  }
}

import 'dart:convert';
import 'dart:developer';

import 'package:conx/firts_part/login_reg/login/models/model_state.dart';
import 'package:conx/firts_part/login_reg/reg/model_reg.dart';
import 'package:conx/firts_part/login_reg/sms/sms_page.dart';
import 'package:conx/widgets/main_url.dart';
import 'package:conx/widgets/saved_box.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedIndexLogin = StateProvider<int>((ref) => 0);

final controllerLogin =
    StateNotifierProvider.autoDispose<ControllerLoginData, ModelStateLogin>(
        (ref) => ControllerLoginData());

class ControllerLoginData extends StateNotifier<ModelStateLogin> {
  ControllerLoginData()
      : super(ModelStateLogin(boolGetData: true, txtError: "")) {
    getRegion();
  }

  var dio = Dio();
  var box = HiveBoxes();

  List<ModelRegCountry> listModelCountry = [];

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

  Future sentForLogin({required BuildContext context}) async {
    try {
      state = state.copyWith(boolGetData1: false, txtError1: "");
      log(box.userPhone.toString().replaceAll("-", ""));
      FormData formData = FormData.fromMap({"phone": box.userPhone.toString().replaceAll("-", "")});
      Response response =
          await dio.post("${MainUrl.urlMain}/api/auth/login/", data: formData);
      log(jsonEncode(response.data).toString());

      state = state.copyWith(boolGetData1: true, txtError1: "");
      Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => SmsVerificationPage("log"),
          ));
    } on DioException catch (e) {
      state = state.copyWith(boolGetData1: true, txtError1: e.toString());
      log(e.toString());
    } catch (ww) {
      print(ww.toString());
    }
  }

  Future setDefault() async {
    state = state.copyWith(boolGetData1: true, txtError1: "");
  }


  String defaultValCountry = "Hududni tanlang";
  String defaultValCountryId = "";
  String defaultValCountryMask = "+xxx-xx-xxx-xx-xx";


  Future getPhoneCodeByTypeUser({required String valPhone})async{
    try{
      for(int i = 0; i < listModelCountry.length; i++){
        if(listModelCountry[i].code.toString().contains(valPhone.trim())){
          state = state.copyWith(boolGetData1: false, txtError1: "");
          defaultValCountry = listModelCountry[i].name;
          defaultValCountryId = listModelCountry[i].code;

          state = state.copyWith(boolGetData1: true, txtError1: "");
          break;
        }
      }



    }catch(e){}
  }
}

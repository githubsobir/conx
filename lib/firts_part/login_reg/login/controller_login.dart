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
      : super(ModelStateLogin(boolGetData: true, txtError: "", message: "")) {
    getRegion();
  }

  var dio = Dio();
  var box = HiveBoxes();

  List<ModelRegCountry> listModelCountry = [];

  Future getRegion() async {
    try {
      state = state.copyWith(boolGetData1: false, txtError1: "", message1: "");
      Response data =
          await dio.get("${MainUrl.urlMain}/api/auth/country-list/");
      listModelCountry
          .addAll((data.data as List).map((e) => ModelRegCountry.fromJson(e)));

      state = state.copyWith(boolGetData1: true, txtError1: "", message1: "");
    } on DioException catch (e) {
      state = state.copyWith(boolGetData1: true, txtError1: e.toString(), message1: "");
      log(e.toString());
    }
  }

  Future sentForLogin({required BuildContext context}) async {
    try {
      state = state.copyWith(boolGetData1: false, txtError1: "", message1: "");
      log(box.userPhone.toString().replaceAll("-", ""));
      FormData formData = FormData.fromMap({"phone": box.userPhone.toString().replaceAll("-", "")});
      Response response =
          await dio.post("${MainUrl.urlMain}/api/auth/login/", data: formData);
      log(jsonEncode(response.data).toString());

      state = state.copyWith(boolGetData1: true, txtError1: "", message1: "");
      Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => const SmsVerificationPage("log"),
          ));
    } on DioException catch (e) {
      if(e.response!.statusCode.toString() == "407" ){
        state = state.copyWith(boolGetData1: true, txtError1: e.message.toString(), message1: e.response!.statusCode.toString());
      }else{
      state = state.copyWith(boolGetData1: true, txtError1: e.toString(), message1: "/api/auth/login/");}
      log(e.toString());
    } catch (ww) {
      print(ww.toString());
    }
  }

  Future setDefault() async {
    state = state.copyWith(boolGetData1: true, txtError1: "", message1: "");
  }


  String defaultValCountry = "Hududni tanlang";
  String defaultValCountryId = "";
  String defaultValCountryMask = "+xxx-xx-xxx-xx-xx";


  Future getPhoneCodeByTypeUser({required String valPhone})async{
    try{
      for(int i = 0; i < listModelCountry.length; i++){
        if(listModelCountry[i].code.toString().trim().contains(valPhone.trim())){

          state = state.copyWith(boolGetData1: false, txtError1: "", message1: "");
          defaultValCountry = listModelCountry[i].name;
          defaultValCountryId = listModelCountry[i].code;

          state = state.copyWith(boolGetData1: true, txtError1: "", message1: "");
        }
      }



    }catch(e){}
  }
}

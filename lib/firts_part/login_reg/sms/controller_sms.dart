import 'dart:convert';
import 'dart:developer';

import 'package:conx/firts_part/login_reg/sms/model_sms/model_sms_action.dart';
import 'package:conx/firts_part/login_reg/sms/model_sms/model_token.dart';
import 'package:conx/firts_part/user_fill/user_fill.dart';
import 'package:conx/widgets/main_url.dart';
import 'package:conx/widgets/saved_box.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final smsTextLengthLess5 = StateProvider<int>((ref) => 0);
final smsTimer = StateProvider<int>((ref) => 59);

final smsTimeEnd = StateProvider<bool>((ref) => true);

final textSmsCode = StateProvider<String>((ref) => "");

final smsMainController =
    StateNotifierProvider<SmsControllerClass, ModelSmsAction>(
        (ref) => SmsControllerClass());

class SmsControllerClass extends StateNotifier<ModelSmsAction> {
  SmsControllerClass()
      : super(ModelSmsAction(
            boolGetData: true,
            txtError: "1",
            actionCode: "1",
            txtSmsNote: "1")) {
    ModelSmsAction(
        boolGetData: true, txtError: "1", actionCode: "1", txtSmsNote: "1");
  }

  var dio = Dio();
  var box = HiveBoxes();

  Future sentForCheckServer(
      {required String smsCode, required BuildContext context, required String windowId}) async {
    try {
      log("sentForCheckServer");

      state = state.copyWith(
          actionCode1: "0", boolGetData1: false, txtError1: "", txtSmsNote: "");

        log(box.userPhone.toString().replaceAll("-", ""));
        log(smsCode.toString());
        log(box.userType.toString());
        log(windowId == "log"? "/api/auth/verify-login/":"/api/auth/verify-register/");
        String phone = box.userPhone.toString().replaceAll("-","");
      try {
        FormData formData = FormData.fromMap(
            {"phone": phone, "code": smsCode, "role": box.userType });
    // box.userType == "1"?"Driver":"Client"

        Response response = await dio.post(
            "${MainUrl.urlMain}${windowId == "log"? "/api/auth/verify-login/":"/api/auth/verify-register/"}",
            data: formData);
        log("sms sent");
        log(jsonEncode(response.data).toString());
        ModelGetToken modelGetToken = ModelGetToken.fromJson(response.data);
        box.userToken = modelGetToken.token.access.toString();

        Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => UserFIO(),
            ));
      } catch (e) {
        log(e.toString());
      }
      state = state.copyWith(
          actionCode1: "1", boolGetData1: true, txtError1: "", txtSmsNote: "");
      await Future.delayed(const Duration(milliseconds: 1800));
      state = state.copyWith(
          actionCode1: "1",
          boolGetData1: true,
          txtError1: "",
          txtSmsNote: "999");
    } on DioException catch (e) {
      if (e.response!.statusCode.toString() == "404") {
        state = state.copyWith(
            actionCode1: "1",
            boolGetData1: true,
            txtError1: e.toString(),
            txtSmsNote: "999");
      } else if (e.response!.statusCode.toString() == "400") {
        /// login pagega otish kerak
        state = state.copyWith(
            actionCode1: "1",
            boolGetData1: true,
            txtError1: e.toString(),
            txtSmsNote: "login");
      } else {
        state = state.copyWith(
            actionCode1: "2",
            boolGetData1: true,
            txtError1: e.toString(),
            txtSmsNote: "");
      }
    } catch (e2) {
      log(e2.toString());
    }
  }

  Future reSentForRegistration() async {
    try {
      state = state.copyWith(
          actionCode1: "0", boolGetData1: false, txtError1: "", txtSmsNote: "");
      FormData formData = FormData.fromMap({"phone": box.userPhone.toString().replaceAll("-","")});
      Response response = await dio
          .post("${MainUrl.urlMain}/api/auth/register/", data: formData);
      log(jsonEncode(response.data).toString());
      state = state.copyWith(
          actionCode1: "1", boolGetData1: true, txtError1: "", txtSmsNote: "");
      log("message to server");
      log(jsonEncode(formData).toString());
      log("###");
      // log(response.data.toString());
      state = state.copyWith(
          actionCode1: "1",
          boolGetData1: false,
          txtError1: "999",
          txtSmsNote: "1000");
    } on DioException catch (e) {
      state = state.copyWith(
          actionCode1: "2",
          boolGetData1: false,
          txtError1: e.toString(),
          txtSmsNote: "");
    } catch (ww) {

    }
  }


  Future reSentForLogin() async {
    try {
      state = state.copyWith(
          actionCode1: "0", boolGetData1: false, txtError1: "", txtSmsNote: "");
      FormData formData = FormData.fromMap({"phone": box.userPhone.toString().replaceAll("-","")});
      Response response =
      await dio.post("${MainUrl.urlMain}/api/auth/login/", data: formData);
      log(jsonEncode(response.data).toString());
      state = state.copyWith(
          actionCode1: "1", boolGetData1: true, txtError1: "", txtSmsNote: "");
      log("message to server");
      log(jsonEncode(formData).toString());
      log("###");

      state = state.copyWith(
          actionCode1: "1",
          boolGetData1: false,
          txtError1: "999",
          txtSmsNote: "1000");
    } on DioException catch (e) {
      state = state.copyWith(
          actionCode1: "2",
          boolGetData1: false,
          txtError1: e.toString(),
          txtSmsNote: "");
    } catch (ww) {
      print("####");
      print(ww.toString());
    }
  }


  Future getDefault() async {
    state = state.copyWith(
        boolGetData1: true, txtError1: "1", actionCode1: "1", txtSmsNote: "1");
  }
}

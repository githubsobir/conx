import 'dart:convert';
import 'dart:developer';

import 'package:conx/firts_part/user_fill/model_user/model_main_user.dart';
import 'package:conx/firts_part/user_fill/model_user/model_user_fio.dart';
import 'package:conx/firts_part/user_fill/user_birth.dart';
import 'package:conx/widgets/main_url.dart';
import 'package:conx/widgets/saved_box.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userController =
    StateNotifierProvider<UserNotifairProvider, ModelUserController>(
        (ref) => UserNotifairProvider());

class UserNotifairProvider extends StateNotifier<ModelUserController> {
  UserNotifairProvider()
      : super(
            ModelUserController(success: true, message: "", errorMessage: ""));
  var box = HiveBoxes();
  var dio = Dio();

  /// box.userType === 1 bo'la driver
  /// box.userType === 2 bo'lsa yuk jo'natuvchi

  Future getUserFio() async {
    late Response response;
   late  ModelUserFio modelUserFio1;
    try {
      print("getUserFio");
      print(box.userType.toString());
      state = state.copyWith(success1: false, message1: "", errorMessage1: "");

        if(box.userType.toString() == "1") {
          
        response = await dio.get(
            "${MainUrl.urlMain}/api/driver/full-name-update-retrieve/",
            options: Options(headers: {"Authorization":"Bearer ${box.userToken}"}));

        modelUserFio1 = ModelUserFio.fromJson(response.data);
        }else{
          response = await dio.get(
              "${MainUrl.urlMain}/api/client/full-name-update-retrieve/",
              options: Options(headers: {"Authorization":"Bearer ${box.userToken}"}));
          modelUserFio1 = ModelUserFio.fromJson(response.data);
        }
      log("123");
      //
      box.userName = modelUserFio1.name??"1";
      box.userFName = modelUserFio1.lastName??"1";
      box.userSName = modelUserFio1.surname??"1";
      state = state.copyWith(success1: true, message1: "", errorMessage1: "");

    } on DioException catch (e) {
      log(e.toString());
      state = state.copyWith(
          success1: true, message1: "", errorMessage1: e.message.toString());
    }catch(ee){
      log(ee.toString());
      state = state.copyWith(
          success1: true, message1: "", errorMessage1: ee.toString());
    }
  }

  Future setUserFIO(
      {
        required BuildContext context,
        required String lName,
      required String sName,
      required String name}) async {
    late Response response;

    try {
      FormData formData = FormData.fromMap({
        "name": name,
        "last_name": lName,
        "surname": sName,
      });
      state = state.copyWith(success1: false, message1: "", errorMessage1: "");
      if (box.userType == "1") {
        log("1");
       try{
         response = await dio.post("${MainUrl.urlMain}/api/driver/full-name/",
             data: formData,
             options:
             Options(headers: {"Authorization": "Bearer ${box.userToken}"}));
         ModelUserFio modelUserFio = ModelUserFio.fromJson(response.data);
         box.userName = modelUserFio.name??"";
         box.userFName = modelUserFio.lastName??"";
         box.userSName = modelUserFio.surname??"";
       }catch(ee){
         log("ee.toString()");
         log(ee.toString());
       }



      } else {
        response = await dio.post("${MainUrl.urlMain}/api/client/full-name/",
            data: formData,
            options:
                Options(headers: {"Authorization": "Bearer ${box.userToken}"}));
        ModelUserFio modelUserFio = ModelUserFio.fromJson(response.data);
        box.userName = modelUserFio.name??"";
        box.userFName = modelUserFio.lastName??"";
        box.userSName = modelUserFio.surname??"";
      }

      Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => const UserBoth(),
          ));


      state = state.copyWith(success1: true, message1: "", errorMessage1: "");

    } on DioException catch (e) {
      log("DioException setName");
      state = state.copyWith(
          success1: true,
          message1: e.response!.statusCode.toString(),
          errorMessage1: e.message.toString());
      log(e.toString());
    } catch (ee) {
      log("ee setName 23er");
      state = state.copyWith(
          success1: true, message1: "1111", errorMessage1: ee.toString());
      log(ee.toString());
    }
  }



  Future updateUserFIO(
      {required String lName,
        required String sName,
        required String name,
        required BuildContext context
      }) async {
    late Response response;
    log("update");
    try {
      FormData formData = FormData.fromMap({
        "name": name,
        "last_name": lName,
        "surname": sName,
      });
      state = state.copyWith(success1: false, message1: "", errorMessage1: "");
      if (box.userType == "1") {
        response = await dio.patch("${MainUrl.urlMain}/api/driver/full-name-update-retrieve/",
            data: formData,
            options:
            Options(headers: {"Authorization": "Bearer ${box.userToken}"}));
      } else {
        response = await dio.patch("${MainUrl.urlMain}/api/client/full-name-update-retrieve/",
            data: formData,
            options:
            Options(headers: {"Authorization": "Bearer ${box.userToken}"}));
      }

      ModelUserFio modelUserFio = ModelUserFio.fromJson(response.data);
      box.userName = modelUserFio.name;
      box.userFName = modelUserFio.lastName;
      box.userSName = modelUserFio.surname;
      log(jsonEncode(response.data).toString());

      state = state.copyWith(success1: true, message1: "", errorMessage1: "");

    } on DioException catch (e) {
      state = state.copyWith(
          success1: true,
          message1: e.response!.statusCode.toString(),
          errorMessage1: e.message.toString());
      log(e.toString());
    } catch (ee) {
      state = state.copyWith(
          success1: true, message1: "1111", errorMessage1: ee.toString());
      log(ee.toString());
    }
  }
}

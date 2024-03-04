import 'dart:convert';
import 'dart:developer';

import 'package:conx/firts_part/user_fill/model_user_birth/model_both_user.dart';
import 'package:conx/firts_part/user_fill/model_user_birth/model_user_birth.dart';
import 'package:conx/widgets/main_url.dart';
import 'package:conx/widgets/saved_box.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userBirthController =
    StateNotifierProvider<UserBothNotifairProvider, ModelUserBirthController>(
        (ref) => UserBothNotifairProvider());

class UserBothNotifairProvider extends StateNotifier<ModelUserBirthController> {
  UserBothNotifairProvider()
      : super(ModelUserBirthController(
            success: true, message: "", errorMessage: "")) {

  }

  var box = HiveBoxes();
  var dio = Dio();

  /// box.userType === 1 bo'la driver
  /// box.userType === 2 bo'lsa yuk jo'natuvchi

  Future getUserBirth() async {
    late Response response;
    late ModelUserBirth modelUserBirth;
    try {
      print("getUserBirth");
      print(box.userType.toString());
      state = state.copyWith(success1: false, message1: "", errorMessage1: "");
      if (box.userType.toString() == "1") {
        response = await dio.get(
            "${MainUrl.urlMain}/api/driver/date-birth-retrieve-update/",
            options:
                Options(headers: {"Authorization": "Bearer ${box.userToken}"}));

        log(jsonEncode(response.data).toString());

        modelUserBirth = ModelUserBirth.fromJson(response.data);
      } else {
        response = await dio.get(
            "${MainUrl.urlMain}/api/client/date-birth-retrieve-update/",
            options:
                Options(headers: {"Authorization": "Bearer ${box.userToken}"}));
        modelUserBirth = ModelUserBirth.fromJson(response.data);
      }
      box.userBirth = modelUserBirth.date.toString();
      log(modelUserBirth.date.toString());
      state = state.copyWith(success1: true, message1: "", errorMessage1: "");
    } on DioException catch (e) {
      log("on DioException catch");
      log(e.toString());
      state = state.copyWith(
          success1: true, message1: "", errorMessage1: e.message.toString());
    } catch (ee) {
      log("ee222");
      log(ee.toString());
      state = state.copyWith(
          success1: true, message1: "", errorMessage1: ee.toString());
    }
  }

  Future setUserBirth({required String date}) async {
    late Response response;
    log("setUserBirth");
    try {



      log("###");
      log(box.userType.toString());
      log(box.userToken.toString());

      state = state.copyWith(success1: false, message1: "", errorMessage1: "");
      if (box.userType.toString() == "1") {
        FormData formData = FormData.fromMap({

          "date": date,
        });
        response = await dio.post(
            "${MainUrl.urlMain}/api/driver/date-birth/",
            data: formData,
            options:
                Options(headers: {"Authorization": "Bearer ${box.userToken}"}));
      } else {
        FormData formData = FormData.fromMap({

          "birth_date": date,
        });
        response = await dio.post("${MainUrl.urlMain}/api/client/date-birth/",
            data: formData,
            options:
                Options(headers: {"Authorization": "Bearer ${box.userToken}"}));
      }



      ModelUserBirth modelUserFio = ModelUserBirth.fromJson(response.data);
      box.userBirth = modelUserFio.date.toString();
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

  Future updateUserBirth(
      {
      required String date}) async {
    late Response response;
    log("###99");
    log( box.userBirth.toString());
    log(date);
    try {
      FormData formData = FormData.fromMap({
        "date": date
      });
      state = state.copyWith(success1: false, message1: "", errorMessage1: "");
      if (box.userType == "1") {
        response = await dio.patch(
            "${MainUrl.urlMain}/api/driver/date-birth-retrieve-update/",
            data: formData,
            options:
                Options(headers: {"Authorization": "Bearer ${box.userToken}"}));
      } else {
        response = await dio.put(
            "${MainUrl.urlMain}/api/client/date-birth-retrieve-update/",
            data: formData,
            options:
                Options(headers: {"Authorization": "Bearer ${box.userToken}"}));
      }
      ModelUserBirth modelUserFio = ModelUserBirth.fromJson(response.data);
      box.userBirth = modelUserFio.date;
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

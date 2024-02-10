import 'package:conx/pages/main/models/model_main.dart';
import 'package:conx/pages/main/models/model_main_page_controller.dart';
import 'package:conx/widgets/main_url.dart';
import 'package:conx/widgets/saved_box.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ControllerMainPage extends StateNotifier<ModelControllerMainPage> {
  ControllerMainPage()
      : super(ModelControllerMainPage(
            boolGetData: false, message: "", errorMessage: ""));

  var dio = Dio();
  var box = HiveBoxes();
  List<ModelMainPage> listMainPage = [];

  Future getMainPageData() async {
    try {
      state =
          state.copyWith(boolGetData1: false, message1: "", errorMessage1: "");

      Response response = await dio.get(
          "${MainUrl.urlMain}/api/client/order-list/",
          options:
              Options(headers: {"Authorization": "Bearer ${box.userToken}"}));

      listMainPage = (response.data as List)
          .map((e) => ModelMainPage.fromJson(e))
          .toList();
      state =
          state.copyWith(boolGetData1: true, message1: "", errorMessage1: "");
    } on DioException catch (ee) {
      state = state.copyWith(
          boolGetData1: true,
          message1: ee.toString(),
          errorMessage1: ee.toString());
    } catch (e) {}
  }
}

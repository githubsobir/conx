import 'package:conx/scefics/drivers/cargo_transport/color_car/model_car/model_car.dart';
import 'package:conx/scefics/drivers/cargo_transport/color_car/model_car/model_car_controller.dart';
import 'package:conx/widgets/main_url.dart';
import 'package:conx/widgets/saved_box.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



final controllerCarColor = StateNotifierProvider.autoDispose<ControllerCarColor, ModelCarColorController>((ref) => ControllerCarColor());

class ControllerCarColor extends StateNotifier<ModelCarColorController> {
  ControllerCarColor()
      : super(ModelCarColorController(
            boolGetData: true, message: "", errorMessage: "")){
    getData();
  }

  var dio = Dio();
  var box = HiveBoxes();
  List<MadelCarColor> listModelCarColor = [];

  Future getData() async {
    try {
      state =
          state.copyWith(boolGetData1: false, message1: "", errorMessage1: "");

      Response response =
          await dio.get("${MainUrl.urlMain}/api/driver/colors/");

      listModelCarColor = (response.data as List)
          .map((e) => MadelCarColor.fromJson(e))
          .toList();

      state =
          state.copyWith(boolGetData1: true, message1: "", errorMessage1: "");
    } on DioException catch (ee) {
      state = state.copyWith(
          boolGetData1: true,
          message1: ee.toString(),
          errorMessage1: ee.toString());
    } catch (e) {
      state = state.copyWith(
          boolGetData1: true,
          message1: e.toString(),
          errorMessage1: e.toString());
    }
  }
}

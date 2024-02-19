import 'package:conx/scefics/drivers/cargo_transport/controler_weigth/model_server_weigth_car.dart';
import 'package:conx/scefics/drivers/cargo_transport/controler_weigth/model_weigth.dart';
import 'package:conx/widgets/main_url.dart';
import 'package:conx/widgets/saved_box.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final controllerCarWeigthServer =
    StateNotifierProvider<ControllerWeigth, ModelWeightCar>(
        (ref) => ControllerWeigth());

class ControllerWeigth extends StateNotifier<ModelWeightCar> {
  ControllerWeigth()
      : super(
            ModelWeightCar(boolGetData: true, message: "", errorMessage: "")) {
    getData();
  }

  var dio = Dio();
  var box = HiveBoxes();
  List<MadelWeigthCarServer> listModelWeigth = [];

  Future getData() async {
    try {
      state =
          state.copyWith(boolGetData1: false, message1: "", errorMessage1: "");
      Response response =
          await dio.get("${MainUrl.urlMain}/api/driver/transport-weight-type/");
      listModelWeigth = (response.data as List)
          .map((e) => MadelWeigthCarServer.fromJson(e))
          .toList();
      state =
          state.copyWith(boolGetData1: true, message1: "", errorMessage1: "");
    } catch (e) {}
  }
}

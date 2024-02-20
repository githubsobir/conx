import 'package:conx/scefics/drivers/cargo_transport/car_models/model_car_models/car_model.dart';
import 'package:conx/scefics/drivers/cargo_transport/car_models/model_car_models/controller_car_models.dart';
import 'package:conx/widgets/main_url.dart';
import 'package:conx/widgets/saved_box.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final controllerCarModel = StateNotifierProvider.autoDispose<ControllerCarModel,
    ModelCarModelController>((ref) => ControllerCarModel());

class ControllerCarModel extends StateNotifier<ModelCarModelController> {
  ControllerCarModel()
      : super(ModelCarModelController(
            boolGetData: true, message: "", errorMessage: "")) {
    getData();
  }

  var dio = Dio();
  var box = HiveBoxes();
  List<MadelCarModel> listCarModel = [];

  Future getData() async {
    try {
      state =
          state.copyWith(boolGetData1: false, message1: "", errorMessage1: "");
      Response response =
          await dio.get("${MainUrl.urlMain}/api/driver/model-transport/?filter_id=${box.modelManufacturer}");
      listCarModel = (response.data as List)
          .map((e) => MadelCarModel.fromJson(e))
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

import 'package:conx/scefics/drivers/cargo_transport/controller_body_type/model_controller_body_type.dart';
import 'package:conx/scefics/drivers/cargo_transport/controller_body_type/model_controller_bodytype_server.dart';
import 'package:conx/widgets/main_url.dart';
import 'package:conx/widgets/saved_box.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final controllerCarBodyType = StateNotifierProvider<ControllerBodyType, ModelControllerBodyType >((ref) => ControllerBodyType());


class ControllerBodyType extends StateNotifier<ModelControllerBodyType> {
  ControllerBodyType()
      : super(ModelControllerBodyType(
            boolGetData: true, message: "", errorMessage: "")){
    getData();
  }

  var dio = Dio();
  var box = HiveBoxes();
  List<MadelControllerBodyType> listModelControllerBodyType = [];

  Future getData() async {
    try {
      state =
          state.copyWith(boolGetData1: false, message1: "", errorMessage1: "");
      Response response =
          await dio.get("${MainUrl.urlMain}/api/driver/transport-type/");
      listModelControllerBodyType = (response.data as List)
          .map((e) => MadelControllerBodyType.fromJson(e))
          .toList();
      state =
          state.copyWith(boolGetData1: true, message1: "", errorMessage1: "");
    } catch (e) {}
  }
}

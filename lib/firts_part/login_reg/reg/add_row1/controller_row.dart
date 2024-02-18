import 'package:conx/firts_part/login_reg/reg/add_row1/model_row/model_row_1.dart';
import 'package:conx/widgets/main_url.dart';
import 'package:conx/widgets/saved_box.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final controllerFirstRowName = StateProvider<String>((ref) => "");
final controllerSecondRowName = StateProvider<String>((ref) => "");

final controllerRowChooseFirstTime =
    StateNotifierProvider<ControllerChooseDirectionClass, ModelRow1Choose>(
        (ref) => ControllerChooseDirectionClass());

class ControllerChooseDirectionClass extends StateNotifier<ModelRow1Choose> {
  ControllerChooseDirectionClass()
      : super(ModelRow1Choose(statusData: "1", textError: "", note: ""));

  var box = HiveBoxes();
  var dio = Dio();

  Future getFirstDirection() async {
    try {
      state = state.copyWith("0", "", "");
      Response response = await dio.get("${MainUrl.urlMain}/");
      state = state.copyWith("1", "", "");
    } on DioException catch (ee) {
      state = state.copyWith("1", ee.toString(), ee.toString());
    } catch (e) {
      state = state.copyWith("1", e.toString(), e.toString());
    }
  }

  Future getSecondDirection() async {
    try {
      state = state.copyWith("0", "", "");
      Response response = await dio.get("${MainUrl.urlMain}/");
      state = state.copyWith("1", "", "");
    } on DioException catch (ee) {
      state = state.copyWith("1", ee.toString(), ee.toString());
    } catch (e) {
      state = state.copyWith("1", e.toString(), e.toString());
    }
  }
}

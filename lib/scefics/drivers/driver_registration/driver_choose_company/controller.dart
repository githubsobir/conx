import 'package:conx/scefics/drivers/driver_registration/driver_choose_company/model/model_choose_company.dart';
import 'package:conx/scefics/drivers/driver_registration/driver_choose_company/model/model_controller.dart';
import 'package:conx/widgets/main_url.dart';
import 'package:conx/widgets/saved_box.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final controllerDriverChooseLogComp =
    StateNotifierProvider<ControllerChooseCompany, ModelControllerCompany>(
        (ref) => ControllerChooseCompany());

class ControllerChooseCompany extends StateNotifier<ModelControllerCompany> {
  ControllerChooseCompany()
      : super(ModelControllerCompany(
            boolGetData: true, message: "", list: [], errorMessage: "")){
    getData();
  }

  var dio = Dio();
  var box = HiveBoxes();
  List<MadelLogisticCompany> listCompany = [];

  Future getData() async {
    try {
      state = state.copyWith(
          boolGetData1: false, message1: "", list: [], errorMessage1: "");
      Response response =
          await dio.get("${MainUrl.urlMain}/api/logistic/companies/");
      listCompany = (response.data as List)
          .map((e) => MadelLogisticCompany.fromJson(e))
          .toList();

      state = state.copyWith(
          boolGetData1: true, message1: "", list: [], errorMessage1: "");
    } catch (e) {}
  }


  Future chooseComp()async{
    try{

    }catch(e){

    }
  }
}

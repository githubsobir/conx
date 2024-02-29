import 'dart:developer';
import 'dart:io';

import 'package:conx/data/models/model_country_list.dart';
import 'package:conx/pages/active_orders/exporter/model_exporter/model_controller_exporter.dart';
import 'package:conx/pages/active_orders/exporter/model_exporter/model_region_district.dart';
import 'package:conx/pages/active_orders/exporter/model_exporter/model_transport_type.dart';
import 'package:conx/widgets/main_url.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final controllerGetPositionLat =
    StateProvider.autoDispose<double>((ref) => 41.311355762972845);
final controllerGetPositionLong =
    StateProvider.autoDispose<double>((ref) => 69.27950520068407);

final controllerGetPositionSelect = StateProvider.autoDispose<bool>((ref) {
  if (ref.watch(controllerGetPositionLat).toString().length > 4 &&
      ref.watch(controllerGetPositionLong).toString().length > 4) {
    return true;
  } else {
    return false;
  }
});

final getCountryList =
    FutureProvider.autoDispose<List<ModelCountryList>>((ref) async {
  List<ModelCountryList> listCountry = [];
  var _dio = Dio();
  Response response =
      await _dio.get("${MainUrl.urlMain}/api/auth/country-list/");
  listCountry =
      (response.data as List).map((e) => ModelCountryList.fromJson(e)).toList();
  return listCountry;
});

final controllerExporter =
    StateNotifierProvider<ControllerExporter, ModelControllerExporter>(
        (ref) => ControllerExporter());

class ControllerExporter extends StateNotifier<ModelControllerExporter> {
  ControllerExporter()
      : super(ModelControllerExporter(
            boolGetData: true, message: "", errorMessage: ""));

  static final Dio _dio = Dio();
  late File file0;
  late File file1;
  late File file2;
  late File file3;
  late File file4;
  late File file5;

  String regionId = "";
  String regionName = "";

  Future getImageGallery(int index) async {
    try {
      state =
          state.copyWith(boolGetData1: false, message1: "", errorMessage1: "");
      final imagePicker = ImagePicker();

      final pickedFile =
          await imagePicker.pickImage(source: ImageSource.gallery);
      if (index == 0) {
        file0 = File(pickedFile!.path);
      } else if (index == 1) {
        file1 = File(pickedFile!.path);
      } else if (index == 2) {
        file2 = File(pickedFile!.path);
      } else if (index == 3) {
        file3 = File(pickedFile!.path);
      } else if (index == 4) {
        file4 = File(pickedFile!.path);
      } else if (index == 5) {
        file5 = File(pickedFile!.path);
      }
      state =
          state.copyWith(boolGetData1: true, message1: "", errorMessage1: "");
    } catch (e) {
      log(e.toString());
    }
  }

  Future getImagePhoto(int index) async {
    try {
      state =
          state.copyWith(boolGetData1: false, message1: "", errorMessage1: "");
      final imagePicker = ImagePicker();

      final pickedFile =
          await imagePicker.pickImage(source: ImageSource.camera);
      if (index == 0) {
        file0 = File(pickedFile!.path);
      } else if (index == 1) {
        file1 = File(pickedFile!.path);
      } else if (index == 2) {
        file2 = File(pickedFile!.path);
      } else if (index == 3) {
        file3 = File(pickedFile!.path);
      } else if (index == 4) {
        file4 = File(pickedFile!.path);
      } else if (index == 5) {
        file5 = File(pickedFile!.path);
      }

      state =
          state.copyWith(boolGetData1: true, message1: "", errorMessage1: "");
    } catch (e) {
      log(e.toString());
    }
  }

  String region1Name = "";
  String region1Id = "";

  String region2Name = "";
  String region2Id = "";

  String district1Name = "";
  String district1Id = "";

  String district2Name = "";
  String district2Id = "";

  List<ModelRegionDistrict> listRegionDistrict = [];

  Future getRegion(
      {required String index,
      required String regionName,
      required int windowId}) async {
    try {
      state =
          state.copyWith(boolGetData1: false, message1: "", errorMessage1: "");
      if (windowId == 1) {
        region1Name = regionName;
        region1Id = index;
      } else if (windowId == 2) {
        region2Name = regionName;
        region2Id = index;
      }

      Response response =
          await _dio.get("${MainUrl.urlMain}/api/auth/district-list/$index/");
      listRegionDistrict = (response.data as List)
          .map((e) => ModelRegionDistrict.fromJson(e))
          .toList();
      state =
          state.copyWith(boolGetData1: true, message1: "", errorMessage1: "");
    } catch (e) {}
  }

  Future setRegion(
      {required String districtName,
      required String districtId,
      required String windowId}) async {
    if (windowId == "1") {
      district1Name = districtName;
      district1Id = districtId;
    } else if (windowId == "2") {
      district2Name = districtName;
      district2Id = districtId;
    }
  }

  String transportId = "";
  String transportName = "";
  List<ModelTransportType> listTransportType = [];

  Future getTransportType() async {
    try {
      state =
          state.copyWith(boolGetData1: false, message1: "", errorMessage1: "");
      Response response =
          await _dio.get("${MainUrl.urlMain}/api/driver/transport-type/");
      listTransportType = (response.data as List)
          .map((e) => ModelTransportType.fromJson(e))
          .toList();
      state =
          state.copyWith(boolGetData1: true, message1: "", errorMessage1: "");
    } catch (e) {}
  }

  Future setTransportType(
      {required String transportTypeId,
      required String transportTypeName}) async {
    state =
        state.copyWith(boolGetData1: false, message1: "", errorMessage1: "");
    transportId = transportTypeId;
    transportName = transportTypeName;
    state = state.copyWith(boolGetData1: true, message1: "", errorMessage1: "");
  }

  String costName = "";

  Future setCostType({required String paymentType}) async {
    state =
        state.copyWith(boolGetData1: false, message1: "", errorMessage1: "");
    costName = paymentType;
    state = state.copyWith(boolGetData1: true, message1: "", errorMessage1: "");
  }
}

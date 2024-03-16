import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:conx/data/models/model_country_list.dart';
import 'package:conx/pages/active_orders/exporter/model_exporter/model_controller_exporter.dart';
import 'package:conx/pages/active_orders/exporter/model_exporter/model_region_district.dart';
import 'package:conx/pages/active_orders/exporter/model_exporter/model_transport_type.dart';
import 'package:conx/widgets/main_url.dart';
import 'package:conx/widgets/saved_box.dart';
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
  var dio = Dio();
  Response response =
      await dio.get("${MainUrl.urlMain}/api/auth/country-list/");
  listCountry =
      (response.data as List).map((e) => ModelCountryList.fromJson(e)).toList();
  return listCountry;
});

final controllerExporter = StateNotifierProvider.autoDispose<ControllerExporter,
    ModelControllerExporter>((ref) => ControllerExporter());

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

  List<ModelCountryList> listCountry = [];

  Future getCountry() async {
    try {
      log("message");
      log("message");
      state =
          state.copyWith(boolGetData1: false, message1: "", errorMessage1: "");

      Response response =
          await _dio.get("${MainUrl.urlMain}/api/auth/country-list/");
      listCountry = (response.data as List)
          .map((e) => ModelCountryList.fromJson(e))
          .toList();
      state =
          state.copyWith(boolGetData1: true, message1: "", errorMessage1: "");
    } catch (e) {
      log("message");
      log("message");
      log(e.toString());
    }
  }

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
      log(index.toString());
      log(index.toString());
      log(index.toString());

      Response response =
          await _dio.get("${MainUrl.urlMain}/api/auth/district-list/$index/");
      listRegionDistrict = (response.data as List)
          .map((e) => ModelRegionDistrict.fromJson(e))
          .toList();

      log(jsonEncode(response.data).toString());

      state =
          state.copyWith(boolGetData1: true, message1: "", errorMessage1: "");
    } catch (e) {
      log(e.toString());
    }
  }

  Future setRegion(
      {required String districtName,
      required String districtId,
      required String windowId}) async {
    state =
        state.copyWith(boolGetData1: false, message1: "", errorMessage1: "");
    if (windowId == "1") {
      district1Name = districtName;
      district1Id = districtId;
    } else if (windowId == "2") {
      district2Name = districtName;
      district2Id = districtId;
    }

    state = state.copyWith(boolGetData1: true, message1: "", errorMessage1: "");
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

  final _box = HiveBoxes();

  Future setOrder({
    required String name,
    required String weight,
    required String volumeM3,
    required String locationFrom,
    required String locationTo,
    required String transportType,
    required String date,
    required String price,
    required String typePayment,
    required String longitude,
    required String latitude,
    required String description,
  }) async {
    try {
      FormData formData = FormData.fromMap({
        "transport_type": transportType,
        "name": name,
        "location_from": locationFrom.toString(),
        "location_to": locationTo.toString(),
        "date": date,
        "weight": weight,
        "volume_m3": volumeM3,
        "price": price,
        "type_payment": typePayment,
        "description": description,
        "file_1":
            await MultipartFile.fromFile(file5.path, filename: "image_user"),
        "file_2":
            await MultipartFile.fromFile(file5.path, filename: "image_user"),
        "file_3":
            await MultipartFile.fromFile(file5.path, filename: "image_user"),
        "file_4":
            await MultipartFile.fromFile(file5.path, filename: "image_user"),
        "file_5":
            await MultipartFile.fromFile(file5.path, filename: "image_user"),
        "file_6":
            await MultipartFile.fromFile(file5.path, filename: "image_user"),
        // "order_files": [],
        "longitude": longitude,
        "latitude": latitude
      });

      log("token:${_box.userToken}");
      log("transport_type:$transportType");
      log("name:$name");
      log("location_from:$locationFrom");
      log("location_to:$locationTo");
      log("date:$date");
      log("weight:$weight");
      log("volume_m3:$volumeM3");
      log("price:$price");
      log("type_payment:$typePayment");
      log("description:$description");
      log("order_files:${file5.path.toString()}");
      log("longitude:$longitude");
      log("latitude:$latitude");

      Response response = await _dio.post(
          "${MainUrl.urlMain}/api/client/order-create/",
          // "http://192.168.1.9:8000/api/client/order-create/",
          options:
              Options(headers: {"Authorization": "Bearer ${_box.userToken}"}),
          data: formData);
      log(jsonEncode(response.data).toString());
    } on DioException catch (r) {
      log(r.toString());
    } catch (e) {
      log(e.toString());
    }
  }
}

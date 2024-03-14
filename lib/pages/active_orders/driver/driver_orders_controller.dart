import 'package:conx/pages/active_orders/driver/model/order_data.dart';
import 'package:conx/pages/active_orders/driver/model/order_status.dart';
import 'package:conx/widgets/main_url.dart';
import 'package:conx/widgets/saved_box.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

final controllerDriverOrders =
    StateNotifierProvider<DriverOrdersController, OrderStatus>(
        (ref) => DriverOrdersController());

final getDriverOrders = FutureProvider.autoDispose
    .family<List<OrderData>, LatLng>((ref, location) async {
  print("getOrders");
  final Dio dio = Dio();
  final HiveBoxes box = HiveBoxes();
  List<OrderData> orders = [];

  try {
    Response response = await dio.get(
      "${MainUrl.urlMain}/api/client/order-list-for-map",
      queryParameters: {
        'lat': location.latitude,
        'lon': location.longitude
      }
    );

    orders = (response.data as List)
        .map((orderJson) => OrderData.fromJson(orderJson))
        .toList();

    return orders;
  } catch (e) {
    print(e.toString());
    throw Exception();
  }
});

class DriverOrdersController extends StateNotifier<OrderStatus> {
  DriverOrdersController()
      : super(OrderStatus(
            boolGetData: false, message: "", list: [], errorMessage: ""));

  final Dio _dio = Dio();
  final HiveBoxes _box = HiveBoxes();

  Future getOrders(double lat, double lng) async {
    try {
      _dio
          .get("${MainUrl.urlMain}/api/driver/full-name-update-retrieve/",
              queryParameters: {'lat': lat, 'lon': lng},
              options: Options(
                  headers: {"Authorization": "Bearer ${_box.userToken}"}))
          .then((response) {
        List<OrderData> order = (response.data as List)
            .map((orderJson) => OrderData.fromJson(orderJson))
            .toList();
        state = state.copyWith(
            boolGetData1: true, message1: "", list: order, errorMessage1: "");
        return order;
      });
    } catch (e) {
      state = state.copyWith(
          boolGetData1: false,
          message1: "",
          list: [],
          errorMessage1: e.toString());
      throw Exception();
    }
  }
}

import 'package:conx/pages/active_orders/driver/model/order_data.dart';

class OrderStatus {
  bool boolGetData;
  String message;
  List<OrderData> list;
  String errorMessage;

  OrderStatus({
    required this.boolGetData,
    required this.message,
    required this.list,
    required this.errorMessage,
  });

  OrderStatus copyWith({
    required bool boolGetData1,
    required String message1,
    required List<OrderData> list,
    required String errorMessage1,
  }) {
    return OrderStatus(
      boolGetData: boolGetData1,
      message: message1,
      list: list,
      errorMessage: errorMessage1,
    );
  }

  factory OrderStatus.fromJson(Map<String, dynamic> json) => OrderStatus(
        boolGetData: json["boolGetData"],
        message: json["message"],
        list: json["list"],
        errorMessage: json["errorMessage"],
      );

  Map<String, dynamic> toJson() => {
        "boolGetData": boolGetData,
        "message": message,
        "list": list,
        "errorMessage": errorMessage,
      };
}

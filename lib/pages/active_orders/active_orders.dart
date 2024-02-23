import 'package:conx/pages/active_orders/driver/driver_orders.dart';
import 'package:conx/pages/active_orders/exporter/exporter.dart';
import 'package:conx/widgets/saved_box.dart';
import 'package:flutter/material.dart';

class ActiveOrder extends StatelessWidget {
  ActiveOrder({super.key});

  var box = HiveBoxes();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: box.userType == "1" ? DriverOrders() : Exporter(),
    );
  }
}

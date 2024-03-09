import 'package:conx/pages/active_orders/driver/driver_orders_page.dart';
import 'package:conx/theme/app_colors.dart';
import 'package:conx/widgets/saved_box.dart';
import 'package:flutter/material.dart';

@immutable
class ActiveOrder extends StatelessWidget {
  ActiveOrder({super.key});

  final box = HiveBoxes();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white10,
      body: box.userType == "1"
          ? const DriverOrdersPage()
          : const DriverOrdersPage(),
    );
  }
}

import 'package:conx/pages/active_orders/exporter/controller_exporter.dart';
import 'package:conx/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

getBottomSheetTypePayment({required BuildContext context}) {
  showModalBottomSheet(
      context: context,
      barrierColor: AppColors.white50,
      builder: (BuildContext context) {
        return Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(14)),
            height: MediaQuery.of(context).size.height * 0.3,
            child: const TransportTypePayment());
      });
}

class TransportTypePayment extends ConsumerStatefulWidget {
  const TransportTypePayment({super.key});

  @override
  ConsumerState<TransportTypePayment> createState() =>
      _TransportPaymentBottomSheetState();
}

class _TransportPaymentBottomSheetState
    extends ConsumerState<TransportTypePayment> {
  List<String> list = ["Cash", "Card", "Transfer"];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/road2.png"), fit: BoxFit.fill)),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) => ListTile(
                onTap: () {
                  ref
                      .read(controllerExporter.notifier)
                      .setCostType(paymentType: list[index]);
                  Navigator.of(context).pop();
                },
                leading: Text(
                  list[index],
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.white100,
                      fontSize: 16),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: AppColors.white100,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

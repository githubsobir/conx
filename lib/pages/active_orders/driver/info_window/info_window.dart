import 'package:conx/pages/active_orders/driver/info_window/model_product/model_product.dart';
import 'package:conx/pages/active_orders/driver/model/order_data.dart';
import 'package:conx/theme/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomInfoWindows extends StatefulWidget {
  final OrderData orderData;
  final int id;

  const CustomInfoWindows(
      {super.key, required this.id, required this.orderData});

  @override
  State<CustomInfoWindows> createState() => _CustomInfoWindowState();
}

class _CustomInfoWindowState extends State<CustomInfoWindows> {
  @override
  Widget build(BuildContext context) {
    late OrderData orderData;

    @override
    void initState() {
      super.initState();
      orderData = widget.orderData;
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          height: 200,
          width: MediaQuery.of(context).size.width * 0.7,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 100,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(orderData.file1),
                        fit: BoxFit.cover)),
              ),
              Container(
                margin: const EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(orderData.name,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Icons.location_on_rounded, size: 17),
                        SizedBox(
                            width: 140,
                            child: Text(
                                "${orderData.locationFrom}-${orderData.locationTo}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 12)))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: 110,
                            child: Text(" \$ ${orderData.price}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.blue.shade900)))
                      ],
                    ),
                    MaterialButton(
                      height: 40,
                      minWidth: MediaQuery.of(context).size.width * 0.3,
                      color: AppColors.colorBackground,
                      onPressed: () {
                        // Navigator.push(context,CupertinoPageRoute(builder: (context) => DetailPage(),));
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Text("more".tr(),
                          style: const TextStyle(color: Colors.white)),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:io';

import 'package:conx/generated/assets.dart';
import 'package:conx/theme/app_colors.dart';
import 'package:conx/widgets/background_widget.dart';
import 'package:conx/widgets/chart_pie2.dart';
import 'package:easy_pie_chart/easy_pie_chart.dart';
import 'package:flutter/material.dart';

class UserHistoryOrders extends StatefulWidget {
  const UserHistoryOrders({super.key});

  @override
  State<UserHistoryOrders> createState() => _UserHistoryOrdersState();
}

class _UserHistoryOrdersState extends State<UserHistoryOrders> {
  final List<PieData> pies = [
    PieData(value: 0.24, color: Colors.cyan),
    PieData(value: 0.26, color: Colors.yellow),
    PieData(value: 0.25, color: Colors.green),
    PieData(value: 0.35, color: Colors.grey),
  ];

  List<String> list = ["God", "Kvartalniy"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundWidget(),
          SafeArea(
              child: Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                AppBar(
                  leading: Icon(
                      Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back,
                      color: AppColors.white100),
                  backgroundColor: AppColors.transparent,
                  title: Text(
                    "History orders",
                    style: TextStyle(
                        color: AppColors.white100, fontWeight: FontWeight.bold),
                  ),
                  actions: [
                    Padding(
                        padding: const EdgeInsets.all(10),
                        child: Icon(
                          Icons.beach_access,
                          color: AppColors.white100,
                        ))
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppChartPie2(pies: pies, text1: "", text2: ""),
                    const SizedBox(height: 1),
                    Column(
                      children: [
                        itemHistory(
                            titleText: "Summa",
                            colors: AppColors.red,
                            bodyText: "456000"),
                        itemHistory(
                            bodyText: "7",
                            colors: AppColors.blue2,
                            titleText: "Reysi"),
                        itemHistory(
                            bodyText: "6",
                            colors: AppColors.yellow70,
                            titleText: "Pozitiv"),
                        itemHistory(
                            bodyText: "456000",
                            colors: AppColors.green,
                            titleText: "Summa"),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: list.length,
                      itemBuilder:(context, index) =>  Container(
                        width: 120,
                        height: 50,
                        margin: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(Assets.imagesRoad4),
                                fit: BoxFit.fill)),
                      ),),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }

  Widget itemHistory(
      {required String titleText,
      required String bodyText,
      required Color colors}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titleText,
          style: TextStyle(
              color: AppColors.white100,
              fontWeight: FontWeight.bold,
              fontSize: 18),
        ),
        Row(
          children: [
            Container(
              height: 10,
              width: 10,
              decoration: BoxDecoration(color: colors),
            ),
            const SizedBox(width: 10),
            Container(
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                      image: AssetImage(Assets.imagesRoad3), fit: BoxFit.fill)),
              child: Center(
                  child: Text(
                bodyText,
                style: TextStyle(
                    color: AppColors.white100,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              )),
            ),
          ],
        ),
      ],
    );
  }
}

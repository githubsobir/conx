import 'package:conx/theme/app_colors.dart';
import 'package:easy_pie_chart/easy_pie_chart.dart';
import 'package:flutter/material.dart';


class AppChartPie extends StatelessWidget {
  final List<PieData> pies;
  final String text1;
  final String text2;

  const AppChartPie(
      {super.key,
      required this.pies,
      required this.text1,
      required this.text2});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      width: 90,
      child: Stack(
        children: [
          EasyPieChart(
            showValue: false,
            children: pies,
            borderWidth: 10,
            pieType: PieType.crust,
            onTap: (index) {},
            gap: 0.05,
            start: 0,
            shouldAnimate: true,
            animateFromEnd: false,
            size: 100,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "20 %",
                  style: TextStyle(
                      color: AppColors.white100, fontWeight: FontWeight.bold),
                ),
                Text(
                  text1,
                  style: TextStyle(
                      color: AppColors.white100,
                      fontSize: 9,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 1,
                  width: 65,
                  color: Colors.white,
                ),
                Text(
                  text2,
                  style: const  TextStyle(
                    color: Colors.orange,
                    fontSize: 9,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const   Text(
                  "50 %",
                  style: TextStyle(
                      color: Colors.orange, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

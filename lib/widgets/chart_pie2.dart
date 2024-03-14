import 'package:conx/theme/app_colors.dart';
import 'package:easy_pie_chart/easy_pie_chart.dart';
import 'package:flutter/material.dart';

class AppChartPie2 extends StatelessWidget {
  final List<PieData> pies;
  final String text1;
  final String text2;

  const AppChartPie2(
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
            borderWidth: 20,
            borderEdge: StrokeCap.butt,
            pieType: PieType.crust,
            onTap: (index) {},
            gap: 0,
            start: 0,
            shouldAnimate: true,
            animateFromEnd: false,
            size: 100,

          ),

        ],
      ),
    );
  }
}

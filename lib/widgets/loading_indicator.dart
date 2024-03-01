import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

Widget loadingIndicator(){
  return   const LoadingIndicator(
      indicatorType: Indicator.ballPulse,
      colors: [
        Colors.red,
        Colors.orange,
        Colors.yellow,
        Colors.green,
        Colors.blue,
        Colors.indigo,
        Colors.purple,
      ],
      strokeWidth: 1,
      backgroundColor: Colors.white,
      pathBackgroundColor: Colors.black);
}
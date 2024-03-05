import 'package:conx/theme/app_colors.dart';
import 'package:flutter/material.dart';


Widget primaryTextField (TextEditingController controller){
  return SizedBox(
    height: 56,
    child: TextFormField(
      controller: controller,
      style: TextStyle(
          fontSize: 16,
          fontFamily: "Inter",
          fontWeight: FontWeight.w400,
          color: AppColors.white100),
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.red, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.white50, width: 1))),
    ),
  );
}

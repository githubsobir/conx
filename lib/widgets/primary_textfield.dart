import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class PrimaryTextField extends StatelessWidget {
  final TextEditingController controller;

  const PrimaryTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
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
}

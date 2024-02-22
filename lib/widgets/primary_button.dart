import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const PrimaryButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: MaterialButton(
        onPressed: () {
          onPressed();
        },
        height: 56,
        minWidth: double.infinity,
        color: AppColors.primaryButton,
        shape: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        child: Text(text,
            style: TextStyle(
                fontSize: 16,
                fontFamily: "Inter",
                color: AppColors.white100,
                fontWeight: FontWeight.w600)),
      ),
    );
  }
}

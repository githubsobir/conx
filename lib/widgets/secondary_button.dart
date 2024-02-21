import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class SecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const SecondaryButton(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        onPressed();
      },
      height: 56,
      minWidth: double.infinity,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:
              const BorderSide(width: 1, color: AppColors.primaryButton)),
      child: Text(text,
          style: const TextStyle(
              fontSize: 16,
              fontFamily: "Inter",
              color: Colors.white,
              fontWeight: FontWeight.w600)),
    );
  }
}

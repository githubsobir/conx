import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../theme/app_colors.dart';

class ErrorPage extends StatelessWidget {
  final String textUrl;
  final String textError;
  final VoidCallback onPressed;

  const ErrorPage(
      {super.key,
      required this.textUrl,
      required this.textError,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(color: AppColors.greyShade900),
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
          const  Text(
              "link:",
              style: TextStyle(color: AppColors.white100),
            ),
            Text(
              textUrl,
              style: TextStyle(color: AppColors.white100),
            ),

            Divider(),
            const  Text(
              "error:",
              style: TextStyle(color: AppColors.white100),
            ),
            Text(
              textError,
              style: const TextStyle(color: AppColors.white100),
            ),
            MaterialButton(
              onPressed: () {
                onPressed();
              },
              height: 56,
              minWidth: double.infinity,
              color: AppColors.primaryButton,
              shape:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              child:  Text("tryAgain".tr(),
                  style: const TextStyle(
                      fontSize: 16,
                      fontFamily: "Inter",
                      color: AppColors.white100,
                      fontWeight: FontWeight.w600)),
            ),
          ],
        ),
      ),
    );
  }
}

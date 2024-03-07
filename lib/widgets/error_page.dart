import 'package:conx/firts_part/login_reg/reg/reg.dart';
import 'package:conx/widgets/background_widget.dart';
import 'package:conx/widgets/primary_button.dart';
import 'package:conx/widgets/saved_box.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class ErrorPage extends StatefulWidget {
  final String textUrl;
  final String textError;
  final VoidCallback onPressed;

   const ErrorPage(
      {super.key,
      required this.textUrl,
      required this.textError,
      required this.onPressed});

  @override
  State<ErrorPage> createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  var box = HiveBoxes();

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Stack(children: [
      const BackgroundWidget(),
      widget.textError.toString() == "407"
          ? Container(
              margin: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    "link:",
                    style: TextStyle(color: AppColors.white100),
                  ),
                  Text(
                    widget.textUrl,
                    style: TextStyle(color: AppColors.white100),
                  ),
                  const Divider(),
                  Text(
                    "error:",
                    style: TextStyle(color: AppColors.white100),
                  ),
                  Text(
                    widget.textError,
                    style: TextStyle(color: AppColors.white100),
                  ),
                  const SizedBox(height: 20),
                  MaterialButton(
                    onPressed: () {
                      widget.onPressed();
                    },
                    height: 56,
                    minWidth: double.infinity,
                    color: AppColors.primaryButton,
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Text("tryAgain".tr(),
                        style: TextStyle(
                            fontSize: 17,
                            fontFamily: "Inter",
                            color: AppColors.white100,
                            fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
            )
          : Center(
            child: Container(
              margin: const EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Telefon raqam ro'yxatdan o'tmagan",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: AppColors.white100, fontSize: 20),
                  ),
                  const SizedBox(height: 40),
                  PrimaryButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                   text:"tryAgain".tr()
                  ),
                   Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text("YOKI", style: TextStyle(color: AppColors.white100),),
                  ),
                  PrimaryButton(
                      onPressed: () {
                        Navigator.push(context, CupertinoPageRoute(builder: (context) => const Registration(),));
                      },
                      text:"Ro'yxatdan o'tish"
                  ),
                ],
              ),
            ),
          )
    ]));
  }
}

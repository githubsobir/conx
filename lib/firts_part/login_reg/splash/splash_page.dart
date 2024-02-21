import 'dart:async';

import 'package:conx/firts_part/login_reg/choose_page/main_auth_page.dart';
import 'package:conx/firts_part/login_reg/enter_page/lang_model/choose_lang.dart';
import 'package:conx/generated/assets.dart';
import 'package:conx/theme/AppColors.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Timer.periodic(const Duration(milliseconds: 3000), (timer) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const ChooseLang()));
    });

    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              Assets.imagesSplash,
              fit: BoxFit.fill,
            ),
          ),
          Align(
              alignment: Alignment.center,
              child: Image.asset(Assets.imagesIcSplash)),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: const Text(
                  "App version: 1.0.0",
                  style: TextStyle(
                      color: AppColors.white100,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Poppins"),
                ),
              ))
        ],
      ),
    );
  }
}

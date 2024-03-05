import 'dart:io';

import 'package:conx/firts_part/login_reg/login/login_page.dart';
import 'package:conx/firts_part/login_reg/reg/reg.dart';
import 'package:conx/root_and_unver_page/root_page.dart';
import 'package:conx/theme/app_colors.dart';
import 'package:conx/widgets/primary_button.dart';
import 'package:conx/widgets/secondary_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../generated/assets.dart';
import '../../../widgets/background_widget.dart';

class MainAuthPage extends StatelessWidget {
  const MainAuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        const BackgroundWidget(),
        Column(children: [
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(32),
                      ),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(
                          Assets.imagesTruck,
                        ),
                      ),
                      color: Colors.transparent),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: const EdgeInsets.fromLTRB(0, 55, 22, 0),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12),
                        child: IconButton(onPressed: (){
                          Navigator.pop(context);
                        }, icon: Icon(
                            Platform.isIOS?Icons.arrow_back_ios:
                            Icons.arrow_back, color: AppColors.white100,))),
                    Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) => const RootPage(),
                                ),
                                (route) => false);
                          },
                          child: Container(
                            margin: const EdgeInsets.fromLTRB(0, 60, 22, 0),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: AppColors.primaryButton),
                            child: Text("skip".tr(),
                                style: TextStyle(
                                    fontFamily: "Inter",
                                    fontSize: 12,
                                    color: AppColors.white100,
                                    fontWeight: FontWeight.w600)),
                          ),
                        )),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 25, left: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "explore".tr(),
                  style: TextStyle(
                      fontFamily: "Poppins",
                      color: AppColors.white100,
                      fontWeight: FontWeight.w700,
                      fontSize: 32),
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 36),
                  child: Text(
                    "exploreText".tr(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: "Inter",
                        color: AppColors.white80,
                        fontWeight: FontWeight.w400,
                        fontSize: 17),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                PrimaryButton(
                  text: "enter".tr(),
                  onPressed: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const LoginPage(),
                        ));
                  },
                ),
                const SizedBox(height: 12),
                SecondaryButton(
                  text: "registration".tr(),
                  onPressed: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const Registration(),
                        ));
                  },
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ])
      ]),
    );
  }
}

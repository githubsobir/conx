import 'dart:developer';

import 'package:conx/firts_part/user_fill/user_fill.dart';
import 'package:conx/root_and_unver_page/root_page.dart';
import 'package:conx/theme/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget smsSuccessEntered({required BuildContext context, required String windowId}) {
  return Center(
    child: Container(
      margin: const EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.star, size: 50),
          const SizedBox(height: 30),
          Text("smsPasswordSuccess".tr(),
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
          const SizedBox(height: 10),
          Text("smsPasswordSuccessContinue".tr()),
          const SizedBox(height: 30),
          MaterialButton(
            onPressed: () {

            windowId == "log"?


            Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => const RootPage(),
                ))
                :
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => UserFIO(),
                  ));
            },
            height: 50,
            minWidth: double.infinity,
            color: AppColors.colorBackground,
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.grey)),
            child: Text("continue".tr(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white)),
          ),
        ],
      ),
    ),
  );
}

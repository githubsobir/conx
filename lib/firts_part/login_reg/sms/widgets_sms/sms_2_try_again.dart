import 'package:conx/firts_part/login_reg/sms/controller_sms.dart';
import 'package:conx/widgets/app_colors.dart';
import 'package:conx/widgets/saved_box.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

var box = HiveBoxes();

Widget smsTryAgain(
    {required BuildContext context,
    required WidgetRef ref,
    required String windowId}) {
  return ref.watch(smsMainController).txtSmsNote != "login"
      ? Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(ref.watch(smsMainController).txtError,
                    maxLines: 4, textAlign: TextAlign.center),
              ),
              const SizedBox(height: 35),
              MaterialButton(
                onPressed: () {
                  ref.read(smsMainController.notifier).getDefault();
                },
                height: 55,
                color: AppColors.colorBackground,
                minWidth: 100,
                textColor: Colors.white,
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.transparent)),
                child: Text("tryAgain".tr()),
              )
            ],
          ),
        )
      : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                  "${box.userPhone} raqam ro'yxatdan o'tgan login orqali kiring",
                  maxLines: 4,
                  textAlign: TextAlign.center),
            ),
            const SizedBox(height: 35),
            MaterialButton(
              onPressed: () {
                if (windowId == "log") {
                  ref.read(smsMainController.notifier).reSentForLogin();
                } else {
                  ref.read(smsMainController.notifier).reSentForRegistration();
                }
              },
              height: 55,
              color: Colors.blue,
              minWidth: 100,
              textColor: Colors.white,
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.transparent)),
              child: Text("tryAgain".tr()),
            )
          ],
        );
}

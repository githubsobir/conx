import 'dart:io';

import 'package:conx/data/models/theme_type.dart';
import 'package:conx/firts_part/login_reg/sms/controller_sms.dart';
import 'package:conx/theme/app_colors.dart';
import 'package:conx/widgets/background_widget.dart';
import 'package:conx/widgets/primary_button.dart';
import 'package:conx/widgets/saved_box.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';


Widget smsTextEnterPage(
    {required BuildContext context,
    required WidgetRef ref,
    required String windowId}) {
  var box = HiveBoxes();
  late CountdownController countdownController =
      CountdownController(autoStart: true);
  TextEditingController textEditingController = TextEditingController();

  return Stack(
    children: [
      const BackgroundWidget(),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 56),
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Platform.isIOS? Icons.arrow_back_ios:
                Icons.arrow_back,
                color: AppColors.white100,
              )),
          const SizedBox(height: 40),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Text("passCode".tr(),
                style: TextStyle(
                    color: AppColors.white100,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w700,
                    fontSize: 30)),
          ),
          const SizedBox(height: 12),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'verificationCode'.tr(args: [box.userPhone]),
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: "Inter",
                  color: AppColors.white80,
                  fontSize: 18),
            ),
          ),
          const SizedBox(height: 36),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: 70,
              width: MediaQuery.of(context).size.width * 0.9,
              child: PinCodeTextField(
                controller: textEditingController,
                appContext: context,
                animationType: AnimationType.fade,
                keyboardType: TextInputType.number,
                cursorColor: AppColors.transparent,
                backgroundColor: AppColors.transparent,
                enableActiveFill: true,
                length: 5,
                onCompleted: (val) {
                  ref.read(textSmsCode.notifier).state = val;
                },
                textStyle: TextStyle(
                    color: AppColors.white100,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Inter",
                    fontSize: 28),
                pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(10),
                    fieldHeight: 70,
                    fieldWidth: 65,
                    borderWidth: 0.4,
                    activeBorderWidth: 1,
                    selectedBorderWidth: 1,
                    inactiveBorderWidth: 0.4,
                    activeColor: AppColors.red,
                    inactiveColor: AppColors.white50,
                    activeFillColor: AppColors.transparent,
                    selectedColor: AppColors.red,
                    selectedFillColor: AppColors.transparent,
                    inactiveFillColor: AppColors.transparent),
                animationDuration: const Duration(milliseconds: 300),
                onChanged: (value) {},
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Visibility(
                visible: ref.watch(smsMainController).txtSmsNote == "999",
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      "smsError".tr(),
                      style: TextStyle(
                          fontFamily: "Inter",
                          color: AppColors.red,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                )),
          ),
          const SizedBox(height: 36),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  try {
                    if (windowId == "log") {
                      ref.read(smsMainController.notifier).reSentForLogin();
                    } else {
                      ref
                          .read(smsMainController.notifier)
                          .reSentForRegistration();
                    }
                    ref.read(smsTimeEnd.notifier).state = true;
                    countdownController.restart();
                  } catch (e) {
                    print(e.toString());
                  }
                },
                child: SizedBox(
                    child: Text(
                  "sendAgain".tr(),
                  style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 16,
                      color: !ref.read(smsTimeEnd)
                          ? AppColors.red
                          : AppColors.white100,
                      fontWeight: FontWeight.w400),
                )),
              ),
              const SizedBox(
                width: 12,
              ),
              Countdown(
                seconds: ref.watch(smsTimer),
                controller: countdownController,
                build: (BuildContext context, double time) => Text(
                  "00:${time.toInt() > 10 ? time.toInt().toString() : "0${time.toInt().toString()}"}",
                  style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 16,
                      color: !ref.read(smsTimeEnd)
                          ? AppColors.red
                          : AppColors.white100,
                      fontWeight: FontWeight.w400),
                ),
                interval: const Duration(seconds: 1),
                onFinished: () {
                  ref.read(smsTimeEnd.notifier).state = false;
                },
              ),
            ],
          ),
          const Spacer(),
          Visibility(
            visible: true, //ref.watch(smsTimeEnd),
            child: PrimaryButton(
              text: "check".tr(),
              onPressed: () {
                box.setTheme = ThemeType.light;
                ref.watch(textSmsCode).length > 4
                    ? {
                        ref.read(smsMainController.notifier).sentForCheckServer(
                            smsCode: ref.watch(textSmsCode),
                            context: context,
                            windowId: windowId)
                      }
                    : {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("checkInfo".tr())))
                      };
              },
            ),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      )
    ],
  );
}

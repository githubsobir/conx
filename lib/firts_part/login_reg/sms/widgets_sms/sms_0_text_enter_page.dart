import 'package:conx/firts_part/login_reg/sms/controller_sms.dart';
import 'package:conx/widgets/app_colors.dart';
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

  return Padding(
    padding: const EdgeInsets.only(left: 16, right: 16),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 40),
        Text("passCode".tr(),
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
        const SizedBox(height: 10),
        Text(
          'verificationCode'.tr(args: [box.userPhone]),
          textAlign: TextAlign.start,
          style: const TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 70,
          width: MediaQuery.of(context).size.width * 0.9,
          child: PinCodeTextField(
            controller: textEditingController,
            appContext: context,
            animationType: AnimationType.fade,
            keyboardType: TextInputType.number,
            cursorColor: Colors.black,
            backgroundColor: Colors.white,
            enableActiveFill: true,
            length: 5,
            onCompleted: (val) {
              ref.read(textSmsCode.notifier).state = val;
            },
            pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(10),
                fieldHeight: 70,
                fieldWidth: 65,
                borderWidth: 0.4,
                activeBorderWidth: 1,
                selectedBorderWidth: 1,
                inactiveBorderWidth: 0.4,
                activeColor: ref.watch(smsMainController).txtSmsNote != "999"
                    ? Colors.black
                    : Colors.red,
                inactiveColor: ref.watch(smsMainController).txtSmsNote != "999"
                    ? Colors.grey.shade900
                    : Colors.red,
                activeFillColor: Colors.white,
                selectedColor: ref.watch(smsMainController).txtSmsNote != "999"
                    ? Colors.grey.shade900
                    : Colors.red,
                selectedFillColor: Colors.grey.shade100,
                inactiveFillColor: Colors.white),
            animationDuration: const Duration(milliseconds: 300),
            onChanged: (value) {},
          ),
        ),
        Visibility(
            visible: ref.watch(smsMainController).txtSmsNote == "999",
            child: Column(
              children: [
                const SizedBox(height: 20),
                Text(
                  "smsError".tr(),
                  style: const TextStyle(
                      color: Colors.red, fontWeight: FontWeight.bold),
                )
              ],
            )),
        const SizedBox(height: 60),
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
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Text(
                    "sendAgain".tr(),
                    style: TextStyle(
                      fontSize: !ref.read(smsTimeEnd) ? 17 : 16,
                      color: !ref.read(smsTimeEnd)
                          ? Colors.blue.shade900
                          : Colors.black,
                      fontWeight: !ref.read(smsTimeEnd)
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  )),
            ),
            Countdown(
              seconds: ref.watch(smsTimer),
              controller: countdownController,
              build: (BuildContext context, double time) => Text(
                  "00:${time.toInt() > 10 ? time.toInt().toString() : "0${time.toInt().toString()}"}"),
              interval: const Duration(seconds: 1),
              onFinished: () {
                ref.read(smsTimeEnd.notifier).state = false;
              },
            ),
          ],
        ),
        const SizedBox(height: 20),
        Visibility(
          visible: ref.watch(smsTimeEnd),
          child: MaterialButton(
            onPressed: () {
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

              // ref.watch(textSmsCode.notifier).state = "";
            },
            height: 50,
            minWidth: double.infinity,
            color: AppColors.colorBackground,
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.grey)),
            child: Text("check".tr(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white)),
          ),
        ),
      ],
    ),
  );
}

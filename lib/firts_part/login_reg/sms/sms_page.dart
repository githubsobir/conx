import 'dart:developer';

import 'package:conx/firts_part/login_reg/sms/controller_sms.dart';
import 'package:conx/firts_part/login_reg/sms/widgets_sms/sms_1_loading.dart';
import 'package:conx/firts_part/login_reg/sms/widgets_sms/sms_3_success.dart';
import 'package:conx/firts_part/login_reg/sms/widgets_sms/sms_0_text_enter_page.dart';
import 'package:conx/firts_part/login_reg/sms/widgets_sms/sms_2_try_again.dart';
import 'package:conx/widgets/saved_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SmsVerificationPage extends ConsumerStatefulWidget {
  final String windowId;
  const SmsVerificationPage(this.windowId, {super.key});



  @override
  ConsumerState<SmsVerificationPage> createState() =>
      _SmsVerificationPageState();
}

class _SmsVerificationPageState extends ConsumerState<SmsVerificationPage> {
  String currentText = "";
  var box = HiveBoxes();

  @override
  void initState() {
    log("SmsVerificationPage");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white, body: buildBody());
  }

  Widget buildBody() {
    if (ref.watch(smsMainController).actionCode == "1") {
      return ref.watch(smsMainController).txtSmsNote != "1000"
          ?

          /// sms kod tasdiq oldin
          smsTextEnterPage(
              context: context, ref: ref, windowId: widget.windowId)
          :

          /// sms kod tasdiqlangandan keyin
          smsSuccessEntered(context: context, windowId: widget.windowId);
    } else if (ref.watch(smsMainController).actionCode == "0") {
      /// sms loading
      return smsLoading();
    } else {
      /// sms try again
      return smsTryAgain(context: context, ref: ref, windowId: widget.windowId);
    }
  }
}

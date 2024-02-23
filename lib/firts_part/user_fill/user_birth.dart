import 'package:conx/firts_part/user_fill/controller_user_birth.dart';
import 'package:conx/firts_part/user_fill/widget_user_birth/user_1_birth_loading.dart';
import 'package:conx/firts_part/user_fill/widget_user_birth/user_birth_error.dart';
import 'package:conx/scefics/drivers/driver_registration/driver_reg.dart';
import 'package:conx/theme/app_colors.dart';
import 'package:conx/widgets/background_widget.dart';
import 'package:conx/widgets/primary_button.dart';
import 'package:conx/widgets/saved_box.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../login_reg/login/login_page.dart';

class UserBoth extends ConsumerStatefulWidget {
  const UserBoth({super.key});

  @override
  ConsumerState<UserBoth> createState() => _UserBothState();
}

class _UserBothState extends ConsumerState<UserBoth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [const BackgroundWidget(), buildBody()]),
    );
  }

  Widget buildBody() {
    if (ref.watch(userBirthController).success) {
      return user0BirthDay(context: context, ref: ref);
    } else if (!ref.watch(userBirthController).success) {
      return user1BirthLoading();
    } else if (ref.watch(userBirthController).success &&
        ref.watch(userBirthController).errorMessage.length > 10) {
      return user2BirthError();
    } else {
      return const Center(
        child: Text("default"),
      );
    }
  }

  // late DateTime selectedDate = DateTime.now();

  DateTime now = DateTime.now();

  bool boolSelected = false;
  var box = HiveBoxes();

  TextEditingController textEditingController = TextEditingController();

  late DateTime selectedDate;

  Widget user0BirthDay(
      {required BuildContext context, required WidgetRef ref}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 56,
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.navigate_before,
              color: AppColors.white100,
            ),
          ),
          const SizedBox(height: 40),
          Text(
            "enterBirthday".tr(),
            style: TextStyle(
                color: AppColors.white100,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w700,
                fontSize: 30),
          ),
          const SizedBox(height: 30),
          Text("date".tr(),
              style: TextStyle(
                  color: AppColors.white100,
                  fontFamily: "Inter",
                  fontSize: 14,
                  fontWeight: FontWeight.w400)),
          const SizedBox(height: 6),
          GestureDetector(
            onTap: () {
              _selectDate(context);
            },
            child: Container(
                height: 60,
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: AppColors.white10,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: (boolSelected)
                            ? AppColors.red
                            : AppColors.white50)),
                child: Row(
                  children: [
                    boolSelected
                        ? Text(
                            DateFormat('yyyy-MM-dd').format(selectedDate),
                            style: TextStyle(
                                fontSize: 16,
                                color: AppColors.white100,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w400),
                          )
                        : const SizedBox(),
                  ],
                )),
          ),
          const SizedBox(height: 42),
          PrimaryButton(
              text: "continue".tr(),
              onPressed: () {
                ref.read(userBirthController.notifier).getUserBirth();

                if (box.userBirth.toString().length > 4) {
                  ref.read(userBirthController.notifier).updateUserBirth(
                      date: DateFormat('yyyy-MM-dd')
                          .format(selectedDate)
                          .toString());
                } else {
                  ref.read(userBirthController.notifier).setUserBirth(
                      date: DateFormat('yyyy-MM-dd')
                          .format(selectedDate)
                          .toString());
                }

                Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => const DrawerRegistration(),
                    ));
              }),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "doYouHaveAccount".tr(),
                style: TextStyle(
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w400,
                    color: AppColors.white80,
                    fontSize: 14),
              ),
              const SizedBox(
                width: 4,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const LoginPage(),
                      ));
                },
                child: Text(
                  "login".tr(),
                  style: TextStyle(
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w600,
                      color: AppColors.white100,
                      fontSize: 14),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime picked = await showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 230,
          color: Colors.white,
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  padding: const EdgeInsets.only(right: 20, top: 20),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [Icon(Icons.check)],
                  ),
                ),
              ),
              SizedBox(
                height: 180,
                child: CupertinoDatePicker(
                  initialDateTime: DateTime(2006),
                  onDateTimeChanged: (DateTime newDate) {
                    selectedDate = newDate;
                    boolSelected = true;
                    setState(() {});
                  },
                  mode: CupertinoDatePickerMode.date,
                  minimumDate: DateTime(1960),
                  maximumDate: DateTime(2006),
                ),
              ),
            ],
          ),
        );
      },
    );

    if (picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
}

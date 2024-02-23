import 'package:conx/firts_part/user_fill/controller_user.dart';
import 'package:conx/firts_part/user_fill/user_birth.dart';
import 'package:conx/theme/app_colors.dart';
import 'package:conx/widgets/primary_button.dart';
import 'package:conx/widgets/primary_textfield.dart';
import 'package:conx/widgets/saved_box.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../login_reg/login/login_page.dart';

Widget user0Main({required BuildContext context}) {
  var box = HiveBoxes();

  TextEditingController txtName = TextEditingController(text: box.userName);
  TextEditingController txtFName =
      TextEditingController(text: box.userFName.toString());
  TextEditingController txtSName =
      TextEditingController(text: box.userSName.toString());

  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 20),
    child: SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(height: 56),
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.navigate_before, color: AppColors.white100)),
            const SizedBox(height: 40),
            Text("enterNameAndSurname".tr(),
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontFamily: "Poppins",
                    color: AppColors.white100,
                    fontSize: 30)),
            const SizedBox(height: 32),
            Text("name".tr(),
                style: TextStyle(
                    fontFamily: "Inter",
                    color: AppColors.white100,
                    fontSize: 14,
                    fontWeight: FontWeight.w400)),
            const SizedBox(height: 6),
            PrimaryTextField(controller: txtName),
            const SizedBox(height: 24),
            Text("surname".tr(),
                style: TextStyle(
                    fontFamily: "Inter",
                    color: AppColors.white100,
                    fontSize: 14,
                    fontWeight: FontWeight.w400)),
            const SizedBox(height: 6),
            PrimaryTextField(controller: txtFName),
            const SizedBox(height: 24),
            Text("lastname".tr(),
                style: TextStyle(
                    fontFamily: "Inter",
                    color: AppColors.white100,
                    fontSize: 14,
                    fontWeight: FontWeight.w400)),
            const SizedBox(height: 6),
            PrimaryTextField(controller: txtSName),
            const SizedBox(height: 42),
            Consumer(
              builder: (context, ref, child) => PrimaryButton(
                text: "continue".tr(),
                onPressed: () {
                  if (box.userName.toString().length > 4 ||
                      box.userSName.toString().length > 4 ||
                      box.userFName.toString().length > 4) {
                    ref.read(userController.notifier).updateUserFIO(
                        name: txtName.text.toString(),
                        lName: txtFName.text.toString(),
                        sName: txtSName.text.toString(),
                        context: context);
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const UserBoth(),
                        ));
                  } else {
                    ref.read(userController.notifier).setUserFIO(
                        name: txtName.text.toString(),
                        lName: txtFName.text.toString(),
                        sName: txtSName.text.toString());
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const UserBoth(),
                        ));
                  }
                },
              ),
            ),
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
            const SizedBox(height: 20)
          ],
        ),
      ),
    ),
  );
}

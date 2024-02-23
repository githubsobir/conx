import 'package:conx/firts_part/user_fill/controller_user.dart';
import 'package:conx/theme/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Widget user2BirthError() {
  return Container(
    margin: const EdgeInsets.all(20),
    child: Center(
      child: Consumer(
        builder: (context, ref, child) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(ref.watch(userController).errorMessage),
            MaterialButton(
              onPressed: () {},
              child: Text(
                "tryAgain".tr(),
                style: TextStyle(color: AppColors.white100),
              ),
            )
          ],
        ),
      ),
    ),
  );
}

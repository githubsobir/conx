import 'package:conx/firts_part/login_reg/enter_page/user_category/user_category.dart';
import 'package:conx/firts_part/login_reg/login/login_page.dart';
import 'package:conx/widgets/primary_button.dart';
import 'package:conx/widgets/saved_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

@immutable
class LoginOrRegistration extends StatelessWidget {
  LoginOrRegistration({super.key});

  final box = HiveBoxes();

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      decoration: BoxDecoration(color: AppColors.white10),
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "SanX:",
              style: TextStyle(
                  color: AppColors.white100,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            const Divider(),
           const  SizedBox(
              height: 50,
            ),
            Text(
              "Tizimdan to'liq foydalanish uchun ro'yxatdan o'ting yoki mavjud login va parollingiz orqali kiring ",
              style: TextStyle(color: AppColors.white100),
            ),
            const SizedBox(height: 50),
            PrimaryButton(
              onPressed: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => const LoginPage(),
                    ));
              },
              text: "Login va parol orqali kirish",
            ),
            SizedBox(
              height: 50,
              child: Center(
                child: Text(
                  "YOKI",
                  style: TextStyle(
                      color: AppColors.white100, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            PrimaryButton(
              onPressed: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => const UserCategory(windowIdReg: "0",),
                    ));
              },
              text: "Ro'yxatdan o'tish",
            ),
          ],
        ),
      ),
    ));
  }
}

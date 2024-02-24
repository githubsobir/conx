import 'package:conx/firts_part/login_reg/login/login_page.dart';
import 'package:conx/firts_part/login_reg/reg/reg.dart';
import 'package:conx/widgets/saved_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

@immutable
class LoginOrRegistration extends StatelessWidget {


  LoginOrRegistration(
      {super.key});

  var box = HiveBoxes();

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      decoration: BoxDecoration(color: AppColors.white10),
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              "SanX:",
              style: TextStyle(
                  color: AppColors.white100,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            Divider(),
            SizedBox(
              height: 50,
            ),
            Text(
              "Tizimdan to'liq foydalanish uchun ro'yxatdan o'ting yoki mavjud login va parollingiz orqali kiring ",
              style: TextStyle(color: AppColors.white100),
            ),
            const SizedBox(height: 50),
            MaterialButton(
              onPressed: () {
                Navigator.push(context, CupertinoPageRoute(builder: (context) => Registration(),));
              },
              height: 56,
              minWidth: double.infinity,
              color: AppColors.primaryButton,
              shape:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              child: Text("Ro'yxatdan o'tish",
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Inter",
                      color: AppColors.white100,
                      fontWeight: FontWeight.w600)),
            ),
            const SizedBox(height: 20),
            MaterialButton(
              onPressed: () {
                Navigator.push(context, CupertinoPageRoute(builder: (context) => LoginPage(),));

              },
              height: 56,
              minWidth: double.infinity,
              color: AppColors.primaryButton,
              shape:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              child: Text("Login va parol orqali kirish",
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Inter",
                      color: AppColors.white100,
                      fontWeight: FontWeight.w600)),
            ),
          ],
        ),
      ),
    ));
  }
}

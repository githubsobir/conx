import 'package:conx/firts_part/login_reg/sms/sms_page.dart';
import 'package:conx/widgets/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Text(
              "Регистрация",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            SizedBox(height: 10),
            Text(
              "Пожалуйста, подтвердите код страны и введите свой номер телефона.",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                  border: Border.symmetric(
                      horizontal: BorderSide(color: Colors.grey.shade300))),
              child: ListTile(
                leading: Image.asset(
                  "assets/images/uzb.png",
                  height: 30,
                  width: 40,
                  fit: BoxFit.cover,
                  alignment: Alignment.topRight,
                ),
                title: const Text("Узбекистан"),
                trailing: const Icon(Icons.keyboard_arrow_down_outlined),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.symmetric(
                      horizontal: BorderSide(color: Colors.grey.shade300))),
              child: ListTile(
                leading: Text("+998 |",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w400)),
                title: const Text("00 000 00 00",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400)),
                trailing: const Icon(Icons.keyboard_arrow_down_outlined),
              ),
            ),
            const SizedBox(height: 50),
            MaterialButton(
              onPressed: () {
                Navigator.push(context,CupertinoPageRoute(builder: (context) =>

                   SmsVerificationPage()

                    ));
              },
              height: 50,
              minWidth: double.infinity,
              color: AppColors.colorBackground,
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.grey)),
              child: const Text("Davom etish",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}

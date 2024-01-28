import 'package:conx/root_and_unver_page/root_page.dart';
import 'package:conx/widgets/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class SmsVerificationPage extends StatefulWidget {
  @override
  _SmsVerificationPageState createState() => _SmsVerificationPageState();
}

class _SmsVerificationPageState extends State<SmsVerificationPage> {
  TextEditingController textEditingController = TextEditingController();
  String currentText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Enter the verification code sent to your phone',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            SizedBox(
              height: 60,
              width: MediaQuery.of(context).size.width * 0.5,
              child: PinCodeTextField(
                appContext: context,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 40,
                    borderWidth: 1,
                    activeColor: Colors.black,
                    inactiveColor: Colors.grey.shade900,
                    activeFillColor: Colors.white,
                    selectedColor: Colors.transparent,
                    selectedFillColor: Colors.grey.shade100,
                    inactiveFillColor: Colors.transparent),
                animationDuration: const Duration(milliseconds: 300),
                backgroundColor: Colors.transparent,
                enableActiveFill: true,

                length: 4,
                onChanged: (value) {
                  setState(() {
                    currentText = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 60),
            Text("Отправить код Снова 00:20"),
            const SizedBox(height: 20),
            MaterialButton(
              onPressed: () {
                Navigator.push(context, CupertinoPageRoute(builder: (context) => RootPage(),));

              },
              height: 50,
              minWidth: double.infinity,
              color: AppColors.colorBackground,
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.grey)),
              child: const Text("Tekshirish",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white)),
            ),


          ],
        ),
      ),
    );
  }
}

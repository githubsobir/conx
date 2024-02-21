import 'package:conx/firts_part/login_reg/login/login_page.dart';
import 'package:conx/firts_part/login_reg/reg/reg.dart';
import 'package:conx/root_and_unver_page/root_page.dart';
import 'package:conx/theme/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainAuthPage extends StatefulWidget {
  const MainAuthPage({super.key});

  @override
  State<MainAuthPage> createState() => _MainAuthPageState();
}

class _MainAuthPageState extends State<MainAuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
              margin: const EdgeInsets.only(right: 1, left: 1),
              width: double.infinity,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      "assets/images/illustration.png",
                    ),
                  ),
                  color: Colors.transparent),
            ),
            Align(
                alignment: Alignment.topRight,
                child: SafeArea(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => const RootPage(),
                          ),
                          (route) => false);
                    },
                    child: Container(
                      margin: const EdgeInsets.all(20),
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: const Color.fromRGBO(114, 127, 108, 0.7)),
                      child: Text("transfer".tr(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                )),
          ],
        ),
        const SizedBox(height: 30),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "explore".tr(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 32),
                ),
                Container(
                  margin: const EdgeInsets.only(
                      bottom: 15, top: 10, right: 22, left: 22),
                  child: Text(
                    "exploreText".tr(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 17),
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => LoginPage(),
                        ));
                  },
                  height: 50,
                  minWidth: double.infinity,
                  color: AppColors.colorBackground,
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.grey)),
                  child: Text("enter".tr(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white)),
                ),
                const SizedBox(height: 20),
                MaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const Registration(),
                        ));
                  },
                  height: 50,
                  minWidth: double.infinity,
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.grey)),
                  child: Text("registration".tr(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.colorBackground)),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

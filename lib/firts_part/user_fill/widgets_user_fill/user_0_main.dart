import 'package:conx/firts_part/user_fill/controller_user.dart';
import 'package:conx/firts_part/user_fill/user_birth.dart';
import 'package:conx/theme/app_colors.dart';
import 'package:conx/widgets/saved_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Widget user0Main({required BuildContext context}) {
  var box = HiveBoxes();
  TextEditingController txtName = TextEditingController(text: box.userName);
  TextEditingController txtFName =
      TextEditingController(text: box.userFName.toString());
  TextEditingController txtSName =
      TextEditingController(text: box.userSName.toString());
  return Container(
    margin: const EdgeInsets.all(20),
    child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          const Text(
            "Ismingiz, sharifingiz va familiyangizni kiriting",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          const SizedBox(height: 30),
          const Text("Ism", style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(
            height: 55,
            child: TextFormField(
              controller: txtName,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: AppColors.colorBackground))),
            ),
          ),
          const SizedBox(height: 20),
          const Text("Familiya", style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(
            height: 55,
            child: TextFormField(
              controller: txtFName,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                         const BorderSide(color: AppColors.colorBackground))),
            ),
          ),
          const SizedBox(height: 20),
          const Text("Sharif", style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(
            height: 55,
            child: TextFormField(
              controller: txtSName,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          const SizedBox(height: 40),
          Consumer(
            builder: (context, ref, child) => MaterialButton(
              onPressed: () {
                if (box.userName.toString().length > 4 ||
                    box.userSName.toString().length > 4 ||
                    box.userFName.toString().length > 4) {
                  ref.read(userController.notifier).updateUserFIO(
                      name: txtName.text.toString(),
                      lName: txtFName.text.toString(),
                      sName: txtSName.text.toString(),
                  context: context
                  );
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => UserBoth(),
                      ));
                } else {
                  ref
                      .read(userController.notifier)
                      .setUserFIO(
                          name: txtName.text.toString(),
                          lName: txtFName.text.toString(),
                          sName: txtSName.text.toString());
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => UserBoth(),
                      ));
                }
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
          ),
          // Expanded(
          //     child: Center(
          //       child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.center,
          //         mainAxisAlignment: MainAxisAlignment.end,
          //         children: [
          //           GestureDetector(
          //             onTap: () {
          //               Navigator.push(
          //                   context,
          //                   CupertinoPageRoute(
          //                     builder: (context) => LoginPage(),
          //                   ));
          //             },
          //             child: const Text(
          //               "Akkauntingiz bormi? Kirish",
          //               style: TextStyle(fontWeight: FontWeight.bold),
          //             ),
          //           )
          //         ],
          //       ),
          //     ))
        ],
      ),
    ),
  );
}

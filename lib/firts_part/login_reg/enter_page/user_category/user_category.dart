import 'package:conx/firts_part/login_reg/enter_page/user_category/model_user_category.dart';
import 'package:conx/root_and_unver_page/root_page.dart';
import 'package:conx/theme/app_colors.dart';
import 'package:conx/widgets/background_widget.dart';
import 'package:conx/widgets/primary_button.dart';
import 'package:conx/widgets/saved_box.dart';
import 'package:conx/widgets/secondary_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../generated/assets.dart';
import '../../choose_page/main_auth_page.dart';

class UserCategory extends StatefulWidget {
  const UserCategory({super.key});

  @override
  State<UserCategory> createState() => _UserCategoryState();
}

class _UserCategoryState extends State<UserCategory> {
  int lastIndex = 0;
  String textCheckBoxValue = "";
  var box = HiveBoxes();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundWidget(),
          Container(
            margin: const EdgeInsets.only(right: 25, left: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 140,
                ),
                Text(
                  "chooseRoll".tr(),
                  style: TextStyle(
                      color: AppColors.white100,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w700,
                      fontSize: 30),
                ),
                const SizedBox(height: 18),
                Expanded(
                  child: ListView.builder(
                    itemCount: listModelUserCat.length,
                    itemBuilder: (context, index) => Card(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: (lastIndex == index + 1) ? 1 : 0,
                            color: (lastIndex == index + 1)
                                ? AppColors.primaryButton
                                : AppColors.white50,
                          ),
                          borderRadius: BorderRadius.circular(20.0)),
                      margin: const EdgeInsets.all(6),
                      color: AppColors.white10,
                      child: ListTile(
                        leading: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              listModelUserCat[index].imageAssetLink,
                              height: 32,
                              width: 32,
                              alignment: Alignment.topRight,
                            ),
                          ],
                        ),
                        title: Text(listModelUserCat[index].nameCategory,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: AppColors.white100,
                                fontFamily: "Inter")),
                        subtitle: Text(listModelUserCat[index].textCategory,
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: AppColors.white70,
                                fontFamily: "Inter")),
                        trailing: GestureDetector(
                          child: Radio(
                              fillColor: MaterialStateColor.resolveWith(
                                (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.selected)) {
                                    return AppColors.primaryButton;
                                  }
                                  return AppColors.white50;
                                },
                              ),
                              value: textCheckBoxValue,
                              autofocus: false,
                              groupValue: listModelUserCat[index].nameCategory,
                              onChanged: (val) {
                                textCheckBoxValue =
                                    listModelUserCat[index].nameCategory;
                                setState(() {});

                                /// 1 haydovchi
                                /// 2 yuk jo'natuvchi
                                box.userType = index == 0 ? "Driver" : "Client";
                              }),
                        ),
                        onTap: () {
                          textCheckBoxValue =
                              listModelUserCat[index].nameCategory;
                          box.userType = (index + 1).toString();
                          lastIndex = index + 1;
                          setState(() {});
                        },
                      ),
                    ),
                  ),
                ),
                PrimaryButton(
                  text: "continue".tr(),
                  onPressed: () {
                    textCheckBoxValue.length < 4
                        ? {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                "chooseRoll".tr(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              duration: const Duration(milliseconds: 2500),
                              backgroundColor: Colors.black,
                            ))
                          }
                        : Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => const MainAuthPage(),
                            ));
                  },
                ),
                const SizedBox(height: 12),
                SecondaryButton(
                  text: "skip".tr(),
                  onPressed: () {

                    box.userType = "2";
                    
                    Navigator.pushAndRemoveUntil(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const RootPage(),
                      ),
                      (route) => false,
                    );
                  },
                ),
                const SizedBox(height: 20),
              ],
            ),
          )
        ],
      ),
    );
  }

  List<ModelUserCategory> listModelUserCat = [
    ModelUserCategory(
        id: 1,
        nameCategory: "driver".tr(),
        textCategory: "driverText".tr(),
        imageAssetLink: Assets.iconsIcTruck,
        boolActive: false,
        note: "note"),
    ModelUserCategory(
        id: 1,
        nameCategory: "shipper".tr(),
        textCategory: "shipperText".tr(),
        imageAssetLink: Assets.iconsIcBox,
        boolActive: false,
        note: "note"),
    ModelUserCategory(
        id: 1,
        nameCategory: "logistics".tr(),
        textCategory: "logisticsText".tr(),
        imageAssetLink: Assets.iconsIcGlobus,
        boolActive: false,
        note: "note")
  ];
}

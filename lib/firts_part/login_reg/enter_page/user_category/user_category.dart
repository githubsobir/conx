import 'package:conx/firts_part/login_reg/choose_page/choose_page.dart';
import 'package:conx/firts_part/login_reg/enter_page/user_category/model_user_category.dart';
import 'package:conx/root_and_unver_page/root_page.dart';
import 'package:conx/widgets/app_colors.dart';
import 'package:conx/widgets/saved_box.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(right: 25, left: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "chooseRoll".tr(),
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: ListView.builder(
                  itemCount: listModelUserCat.length,
                  itemBuilder: (context, index) => Card(
                    margin: const EdgeInsets.all(6),
                    color: Colors.white,
                    child: ListTile(
                      leading: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            listModelUserCat[index].imageAssetLink,
                            height: 40,
                            width: 40,
                            fit: BoxFit.cover,
                            alignment: Alignment.topRight,
                          ),
                        ],
                      ),
                      title: Text(listModelUserCat[index].nameCategory,
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text(listModelUserCat[index].textCategory),
                      trailing: GestureDetector(
                        child: Radio(
                            value: textCheckBoxValue,
                            autofocus: false,
                            groupValue: listModelUserCat[index].nameCategory,
                            activeColor: AppColors.colorBackground,
                            onChanged: (val) {
                              textCheckBoxValue =
                                  listModelUserCat[index].nameCategory;
                              setState(() {});

                              /// 1 haydovchi
                              /// 2 yuk jo'natuvchi
                              box.userType = (index+1).toString();
                            }),
                      ),
                      onTap: () {
                        textCheckBoxValue =
                            listModelUserCat[index].nameCategory;
                        box.userType = (index+1).toString();
                        setState(() {});
                      },
                    ),
                  ),
                ),
              ),
              MaterialButton(
                onPressed: () {
                  textCheckBoxValue.length < 4
                      ? {
                          ScaffoldMessenger.of(context).showSnackBar(

                              SnackBar(

                            content: Text(
                              "chooseRoll".tr(),
                              style:const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                            ),

                            duration: const Duration(milliseconds: 2500),
                                backgroundColor: Colors.black,
                          ))
                        }
                      : Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => const ChoosePage(),
                          ));
                },
                height: 55,
                minWidth: double.infinity,
                color: AppColors.colorBackground,
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.grey)),
                child: Text("continue".tr(),
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 10),
              MaterialButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => const RootPage(),
                    ),
                    (route) => false,
                  );
                },
                height: 55,
                minWidth: double.infinity,
                color: Colors.white,
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    )),
                child: Text("skip".tr(),
                    style: const TextStyle(
                        color: AppColors.colorBackground,
                        fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  List<ModelUserCategory> listModelUserCat = [
    ModelUserCategory(
        id: 1,
        nameCategory: "driver".tr(),
        textCategory: "driverText".tr(),
        imageAssetLink: "assets/images/truck.png",
        boolActive: false,
        note: "note"),
    ModelUserCategory(
        id: 1,
        nameCategory: "shipper".tr(),
        textCategory: "shipperText".tr(),
        imageAssetLink: "assets/images/box_category.png",
        boolActive: false,
        note: "note"),
    ModelUserCategory(
        id: 1,
        nameCategory: "logistics".tr(),
        textCategory: "logisticsText".tr(),
        imageAssetLink: "assets/images/globus.png",
        boolActive: false,
        note: "note")
  ];
}

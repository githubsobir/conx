import 'package:conx/firts_part/login_reg/choose_page/choose_page.dart';
import 'package:conx/firts_part/login_reg/enter_page/user_category/model_user_category.dart';
import 'package:conx/widgets/app_colors.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(30),
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
                    child: CheckboxListTile(
                      value: listModelUserCat[index].boolActive,
                      hoverColor: Colors.white,
                      onChanged: (val) {
                        listModelUserCat[index].boolActive = true;
                        listModelUserCat[lastIndex].boolActive = false;
                        lastIndex = index;
                        setState(() {});
                      },
                      checkboxShape: const CircleBorder(),
                      isThreeLine: true,
                      secondary: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          listModelUserCat[index].imageAssetLink,
                          height: 40,
                          width: 40,
                          fit: BoxFit.cover,
                          alignment: Alignment.topRight,
                        ),
                      ),
                      activeColor: AppColors.colorBackground,
                      title: Text(listModelUserCat[index].nameCategory,
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text(listModelUserCat[index].textCategory),
                    ),
                  ),
                ),
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => ChoosePage(),
                      ));
                },
                height: 50,
                minWidth: double.infinity,
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.grey)),
                child: const Text("Tasdiqlash"),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  List<ModelUserCategory> listModelUserCat = [
    ModelUserCategory(
        id: 1,
        nameCategory: "Водитель",
        textCategory:
            "Если у вас есть грузовой автомобиль, вы можете использовать это мобильное приложение, чтобы выбрать подходящий для вас груз.",
        imageAssetLink: "assets/images/truck.png",
        boolActive: false,
        note: "note"),
    ModelUserCategory(
        id: 1,
        nameCategory: "Грузоотправитель",
        textCategory:
            "С помощью этого приложения вы сможете найти подходящий грузовик для вашего груза.",
        imageAssetLink: "assets/images/box_category.png",
        boolActive: false,
        note: "note"),
    ModelUserCategory(
        id: 1,
        nameCategory: "Логистическая компания",
        textCategory:
            "С помощью этого мобильного приложения вы можете вести профиль своей логистической компании и получать хороший доход, принимая множество заказов.",
        imageAssetLink: "assets/images/globus.png",
        boolActive: false,
        note: "note")
  ];
}

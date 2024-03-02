import 'package:conx/generated/assets.dart';
import 'package:conx/theme/app_colors.dart';
import 'package:conx/widgets/background_widget.dart';
import 'package:conx/widgets/primary_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class UserTimeEnd extends StatefulWidget {
  const UserTimeEnd({super.key});

  @override
  State<UserTimeEnd> createState() => _UserTimeEndState();
}

class _UserTimeEndState extends State<UserTimeEnd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      const BackgroundWidget(),
      Column(
        children: [
          AppBar(
            backgroundColor: AppColors.transparent,
            title: const Text("Время окончания тарифа"),
            titleTextStyle: TextStyle(
                color: AppColors.white100,
                fontWeight: FontWeight.bold,
                fontSize: 20),
            iconTheme: IconThemeData(
              color: AppColors.white100,
            ),
            centerTitle: true,
          ),
          SafeArea(
              child: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  height: 150,
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      image: const DecorationImage(image: AssetImage(Assets.imagesRoad4),
                      fit:BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Премиум", style: TextStyle(fontSize: 20, color:AppColors.white100, fontWeight: FontWeight.bold)),
                      Text("24-день 14:34:12", style: TextStyle(fontSize: 36,  color:AppColors.white100)),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(

                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: const DecorationImage(image: AssetImage(Assets.imagesRoad4),
                          fit:BoxFit.fill,
                        ),
                        borderRadius: BorderRadius.circular(15)),

                  child: ListTile(
                    title: Text(listValueUserEnd[0],
                        style:  TextStyle(fontWeight: FontWeight.bold, color:AppColors.white100, )),
                    subtitle:  Text("4.99 \$" , style:  TextStyle(fontWeight: FontWeight.bold, color:AppColors.white100, )),
                    trailing: GestureDetector(
                      child: Radio(
                          value: indexListValueUser,
                          autofocus: false,
                          groupValue: listValueUserEnd[0],
                          fillColor:MaterialStateProperty.resolveWith(getColor),
                          activeColor: AppColors.colorBackground,
                          onChanged: (val) {
                            indexListValueUser = listValueUserEnd[0];
                            setState(() {});
                          }),
                    ),
                    onTap: () {
                      indexListValueUser = listValueUserEnd[0];
                      setState(() {});
                    },
                  ),
                ),
                const SizedBox(height: 10),
                Container(

                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: const DecorationImage(image: AssetImage(Assets.imagesRoad4),
                        fit:BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.circular(15)),

                  child: ListTile(
                    title: Text(listValueUserEnd[1],
                      style:  TextStyle(fontWeight: FontWeight.bold, color:AppColors.white100, )),
                    subtitle: Text("4.99 \$" , style:  TextStyle(fontWeight: FontWeight.bold, color:AppColors.white100, )),
                    trailing: GestureDetector(
                      child: Radio(
                          value: indexListValueUser,
                          autofocus: false,
                          groupValue: listValueUserEnd[1],
                          activeColor: AppColors.colorBackground,
                          fillColor:MaterialStateProperty.resolveWith(getColor),
                          onChanged: (val) {
                            indexListValueUser = listValueUserEnd[1];
                            setState(() {});
                          }),
                    ),
                    onTap: () {
                      indexListValueUser = listValueUserEnd[1];
                      setState(() {});
                    },
                  ),
                ),
                const SizedBox(height: 20),
                PrimaryButton(onPressed: () {}, text: "skip".tr()),

              ],
            ),
          )),
        ],
      ),
    ]));
  }

  String indexListValueUser = "";
  List<String> listValueUserEnd = ["Ежемесячно", "Ежегодный"];
  Color getColor(Set<MaterialState> states) {
    return AppColors.background;
  }
}

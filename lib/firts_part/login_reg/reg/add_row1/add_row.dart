import 'dart:io';

import 'package:conx/firts_part/login_reg/reg/add_row1/controller_row.dart';
import 'package:conx/firts_part/login_reg/reg/add_row1/sheet_region.dart';
import 'package:conx/scefics/drivers/driver_registration/driver_reg.dart';
import 'package:conx/theme/app_colors.dart';
import 'package:conx/widgets/background_widget.dart';
import 'package:conx/widgets/primary_button.dart';
import 'package:conx/widgets/widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddRow1 extends ConsumerStatefulWidget {
  const AddRow1({super.key});

  @override
  ConsumerState<AddRow1> createState() => _AddRow1State();
}

class _AddRow1State extends ConsumerState<AddRow1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundWidget(),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 42,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Platform.isIOS? Icons.arrow_back_ios: Icons.arrow_back,
                    color: AppColors.white100,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  "Выберите свое направление",
                  style: TextStyle(
                      color: AppColors.white100,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Text(
                  "city".tr(),
                  style: TextStyle(
                      color: AppColors.white100,
                      fontSize: 14,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w400),
                ),
                Card(
                  color: AppColors.white10,
                  child: ListTile(
                    onTap: () {
                      getBottomSheetRegionList(context: context, id: 1);
                    },
                    title:

                    Text(
                      ref.watch(controllerRowChooseFirstTime).statusData == "1"?
                      ref.watch(controllerRowChooseFirstTime.notifier).region1Name:"",
                    style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.white100),
                    ),
                    trailing: Icon(
                      Icons.keyboard_arrow_down,
                      color: AppColors.white50,
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.import_export,
                      size: 30,
                      color: AppColors.white100,
                    ),
                  ],
                ),
                Card(
                  color: AppColors.white10,
                  child: ListTile(
                    onTap: () {
                      getBottomSheetRegionList(context: context, id: 2);
                    },
                    title: Text(
                      ref.watch(controllerRowChooseFirstTime).statusData == "1"?
                      ref.watch(controllerRowChooseFirstTime.notifier).region2Name:"",
                      style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.white100),
                    ),
                    trailing: Icon(
                      Icons.keyboard_arrow_down,
                      color: AppColors.white50,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                PrimaryButton(text: "continue".tr(), onPressed: () {
                  if(ref.watch(controllerRowChooseFirstTime.notifier).region1Id.isNotEmpty &&
                      ref.watch(controllerRowChooseFirstTime.notifier).region2Id.isNotEmpty
                  ) {
                        ref.read(controllerRowChooseFirstTime.notifier)
                            .setRegionServer(context: context);

                      }
                  else{
                    MyWidgets.snackBarMyWidgets(context: context, text: "Yo'nalishlarni tanlang");
                  }
                    }),


              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:conx/generated/assets.dart';
import 'package:conx/theme/app_colors.dart';
import 'package:conx/widgets/background_widget.dart';
import 'package:conx/widgets/primary_button.dart';
import 'package:easy_localization/easy_localization.dart';
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
                    Icons.navigate_before,
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
                    onTap: () {},
                    title: Text(""),
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
                    onTap: () {},
                    title: const Text(""),
                    trailing: Icon(
                      Icons.keyboard_arrow_down,
                      color: AppColors.white50,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                PrimaryButton(text: "continue".tr(), onPressed: () {}),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "doYouHaveAccount".tr(),
                      style: TextStyle(
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w400,
                          color: AppColors.white80,
                          fontSize: 14),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      "login".tr(),
                      style: TextStyle(
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w600,
                          color: AppColors.white100,
                          fontSize: 14),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

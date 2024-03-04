import 'dart:developer';

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:conx/pages/main/controller_main_page.dart';
import 'package:conx/theme/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HeaderMain extends ConsumerStatefulWidget {
  const HeaderMain({super.key});

  @override
  ConsumerState<HeaderMain> createState() => _HeaderMainState();
}

class _HeaderMainState extends ConsumerState<HeaderMain> {
  late List<DateTime?> values = [
    DateTime(2021, 8, 10),
    DateTime(2024, 8, 13),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Theme(
          data: Theme.of(context).copyWith(dividerColor: AppColors.transparent),
          child: ExpansionTile(
            collapsedBackgroundColor: AppColors.transparent,
            enableFeedback: true,

            collapsedIconColor: ref.watch(controllerSearchOpen)
                ? AppColors.newOrangeColorForIcon
                : AppColors.white100,
            expansionAnimationStyle: AnimationStyle(
              duration:const Duration(milliseconds: 700),
              curve: Curves.ease,
                reverseCurve: Curves.linear,
              reverseDuration: const Duration(milliseconds: 1500),
                ),

                // reverseDuration: Duration(milliseconds: 200)),
            collapsedShape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppColors.white100, width: 0.4)),
            onExpansionChanged: (val) {
              log(val.toString());
              ref.read(controllerSearchOpen.notifier).state = val;
            },
            backgroundColor: AppColors.transparent,
            iconColor: ref.watch(controllerSearchOpen)
                ? AppColors.newOrangeColorForIcon
                : AppColors.white100,
            leading: Icon(Icons.search, color: ref.watch(controllerSearchOpen)
                ? AppColors.newOrangeColorForIcon
                : AppColors.white100,),
            title: Text("Qidirish",
                style: TextStyle(
                    color:ref.watch(controllerSearchOpen)
                        ? AppColors.newOrangeColorForIcon
                        : AppColors.white100, fontWeight: FontWeight.bold)),
            children: [
              SingleChildScrollView(
                child: Container(
                  height: 290,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      ListTile(
                        onTap: () {
                          getCountryList(0);
                        },
                        leading: const Icon(Icons.my_location_outlined,
                            color: Colors.grey),
                        title: Text(
                            ref.read(controllerMainPageCity1Name).isEmpty
                                ? "Qayerdan"
                                : ref.watch(controllerMainPageCity1Name),
                            style: const TextStyle(color: Colors.grey)),
                        trailing: const Icon(Icons.keyboard_arrow_down_rounded,
                            size: 32, color: Colors.grey),
                      ),
                      Divider(color: Colors.grey.shade200),
                      ListTile(
                        onTap: () {
                          getCountryList(1);
                        },
                        leading: const Icon(CupertinoIcons.location_solid,
                            color: Colors.grey),
                        title: Text(
                            ref.read(controllerMainPageCity2Name).isEmpty
                                ? "Qayerga"
                                : ref.watch(controllerMainPageCity2Name),
                            style: const TextStyle(color: Colors.grey)),
                        trailing: const Icon(Icons.keyboard_arrow_down_rounded,
                            size: 32, color: Colors.grey),
                      ),
                      Divider(color: Colors.grey.shade200),
                      ListTile(
                        onTap: () {
                          getCalendar();
                        },
                        leading: const Icon(Icons.calendar_month,
                            color: Colors.grey),
                        title: const Text("Sesh, 16 yan-Chor, 17 yan",
                            style: TextStyle(color: Colors.grey)),
                      ),
                      MaterialButton(
                        onPressed: () {},
                        minWidth: MediaQuery.of(context).size.width,
                        height: 50,
                        shape: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.zero,
                              topRight: Radius.zero,
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            )),
                        color: AppColors.colorBackground,
                        child: const Text("Qidirish",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  getCalendar() async {
    final value = await showCalendarDatePicker2Dialog(
      context: context,
      config: CalendarDatePicker2WithActionButtonsConfig(
          currentDate: DateTime.now(),
          calendarType: CalendarDatePicker2Type.range,
          dayTextStyle: TextStyle(color: Colors.white),
          disabledDayTextStyle: TextStyle(color: Colors.white),
          weekdayLabelTextStyle: TextStyle(color: Colors.white),
          yearTextStyle: TextStyle(color: Colors.white),
          controlsTextStyle: TextStyle(color: Colors.white),
          selectedRangeHighlightColor: Colors.blueAccent,
          selectedDayHighlightColor: AppColors.colorBackground),
      dialogBackgroundColor: Colors.grey.shade900,
      dialogSize: Size(300, 400),
    );
  }

  // getLocation
  getCountryList(int index123) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Consumer(
        builder: (context, ref, child) => Container(
          height: MediaQuery.of(context).size.height * 0.6,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: ref.watch(controllerMainPage).boolGetData
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15, left: 15),
                        child: Text("region".tr(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                      ),
                      Expanded(
                          child: ListView.builder(
                        itemCount: ref
                            .watch(controllerMainPage.notifier)
                            .listCities
                            .length,
                        itemBuilder: (context, index) => Card(
                          color: Colors.grey.shade200,
                          child: ListTile(
                            onTap: () {
                              if (index123 == 0) {
                                ref
                                        .read(controllerMainPageCity1Name.notifier)
                                        .state =
                                    ref
                                        .watch(controllerMainPage.notifier)
                                        .listCities[index]
                                        .name
                                        .toString();

                                ref
                                        .read(controllerMainPageCity1Id.notifier)
                                        .state =
                                    ref
                                        .watch(controllerMainPage.notifier)
                                        .listCities[index]
                                        .id
                                        .toString();
                              } else if (index123 == 1) {
                                ref
                                        .read(controllerMainPageCity2Name.notifier)
                                        .state =
                                    ref
                                        .watch(controllerMainPage.notifier)
                                        .listCities[index]
                                        .name
                                        .toString();

                                ref
                                        .read(controllerMainPageCity2Id.notifier)
                                        .state =
                                    ref
                                        .watch(controllerMainPage.notifier)
                                        .listCities[index]
                                        .id
                                        .toString();
                              }

                              Navigator.of(context).pop();
                            },
                            title: Text(ref
                                .watch(controllerMainPage.notifier)
                                .listCities[index]
                                .name
                                .toString()),
                            trailing: Icon(Icons.arrow_forward_ios_sharp),
                          ),
                        ),
                      ))
                    ])
              : const Center(child: CupertinoActivityIndicator()),
        ),
      ),
    );
  }
}

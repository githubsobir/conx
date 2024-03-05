import 'package:conx/scefics/drivers/cargo_transport/car_ton_weight/car_weight_and_volume.dart';
import 'package:conx/theme/app_colors.dart';
import 'package:conx/widgets/background_widget.dart';
import 'package:conx/widgets/primary_button.dart';
import 'package:conx/widgets/saved_box.dart';
import 'package:conx/widgets/widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CarDateYear extends ConsumerStatefulWidget {
  const CarDateYear({super.key});

  @override
  ConsumerState<CarDateYear> createState() => _CarDateYearState();
}

class _CarDateYearState extends ConsumerState<CarDateYear> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        iconTheme: IconThemeData(color: AppColors.white100),
      ),
      body: Stack(
        children: [
          const BackgroundWidget(),
          SafeArea(
              child: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    "В каком году выпустили вашу машину",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: AppColors.white100),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    "Год выпуска",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: AppColors.white100),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      _selectDate(context);
                    },
                    child: Container(
                        height: 60,
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            boolSelected
                                ? Text(
                                    DateFormat('yyyy-MM').format(selectedDate),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  )
                                : const SizedBox(),
                          ],
                        )),
                  ),
                  const SizedBox(height: 30),
                  PrimaryButton(
                      onPressed: () {
                        if (boolSelected) {
                          box.modelCarYear = DateFormat('yyyy-MM')
                              .format(selectedDate)
                              .toString();

                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => const CarTonWeightVolume(),
                              ));
                        }else{
                          MyWidgets.snackBarMyWidgets(context: context, text: "Yilni tanlang");
                        }
                      },
                      text: "Davom etish"),
                ]),
          )),
        ],
      ),
    );
  }

  DateTime selectedDate = DateTime.now();
  bool boolSelected = false;
  var box = HiveBoxes();

  Future<void> _selectDate(BuildContext context) async {
    DateTime picked = await showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 230,
          color: Colors.white,
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  padding: const EdgeInsets.only(right: 20, top: 20),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [Icon(Icons.check)],
                  ),
                ),
              ),
              SizedBox(
                height: 180,
                child: CupertinoDatePicker(
                  initialDateTime: DateTime(2020),
                  onDateTimeChanged: (DateTime newDate) {
                    selectedDate = newDate;
                    boolSelected = true;
                    setState(() {});
                  },
                  mode: CupertinoDatePickerMode.monthYear,
                  minimumDate: DateTime(2004),
                  maximumDate: DateTime(2024),
                ),
              ),
            ],
          ),
        );
      },
    );

    if (picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
}

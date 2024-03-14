import 'package:conx/scefics/drivers/driver_registration/driver_license/photo_driver_license.dart';
import 'package:conx/theme/app_colors.dart';
import 'package:conx/widgets/background_widget.dart';
import 'package:conx/widgets/primary_button.dart';
import 'package:conx/widgets/widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DriverLicense extends StatefulWidget {
  const DriverLicense({super.key});

  @override
  State<DriverLicense> createState() => _DriverLicenseState();
}

class _DriverLicenseState extends State<DriverLicense> {
  TextEditingController textSerNum = TextEditingController();
  late DateTime selectedDate = DateTime.now();

  DateTime now = DateTime.now();

  bool boolSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.white100),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            const BackgroundWidget(),
            Container(
              margin: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Водительское удостоверение",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white100),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    "Серия и номер",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: AppColors.white100),
                  ),
                  const SizedBox(height: 5),
                  SizedBox(
                    height: 60,
                    child: TextFormField(
                      controller: textSerNum,
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 1)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 1)),
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.transparent, width: 1),
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Дата истечения срока действия",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: AppColors.white100),
                  ),
                  const SizedBox(height: 5),
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
                                ? Text(DateFormat('yyyy-MM-dd')
                                    .format(selectedDate))
                                : const SizedBox(),
                          ],
                        )),
                  ),
                  const SizedBox(height: 40),
                  PrimaryButton(
                    onPressed: () {
                      if (textSerNum.text.toString().length > 4 &&
                          boolSelected) {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => PhotoDiverLicense(
                                serNums: textSerNum.text.toString(),
                                yyyyMMDs1: DateFormat('yyyy-MM-dd')
                                    .format(selectedDate)
                                    .toString(),
                              ),
                            ));
                      } else {
                        if (textSerNum.text.length > 4 && !boolSelected) {
                          _selectDate(context);
                        } else {
                          MyWidgets.snackBarMyWidgets(
                              context: context, text: "Maydonlarni to'ldiring");
                        }
                      }
                    },
                    text: "Davom etish",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime picked = await showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return Stack(
          children: [
            const BackgroundWidget(),
            Container(
              height: 230,
              color: Colors.transparent,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      padding: const EdgeInsets.only(right: 20, top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.check,
                            color: AppColors.white100,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 180,
                    child: CupertinoTheme(
                      data: CupertinoThemeData(
                          brightness: CupertinoTheme.of(context).brightness,
                          textTheme: CupertinoTextThemeData(
                            dateTimePickerTextStyle: TextStyle(
                                color: AppColors.white100, fontSize: 20),
                          )),
                      child: CupertinoDatePicker(
                        initialDateTime: selectedDate,
                        onDateTimeChanged: (DateTime newDate) {
                          setState(() {
                            selectedDate = newDate;
                            boolSelected = true;
                          });
                        },
                        mode: CupertinoDatePickerMode.date,
                        minimumDate: DateTime(2024),
                        maximumDate: DateTime(2030),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
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

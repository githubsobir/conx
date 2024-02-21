import 'package:conx/scefics/drivers/driver_registration/driver_license/photo_driver_license.dart';
import 'package:conx/theme/app_colors.dart';
import 'package:conx/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Водительское удостоверение",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              const Text("Серия и номер"),
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
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 1)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 1)),
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.transparent, width: 1),
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              const SizedBox(height: 20),
              const Text("Дата истечения срока действия"),
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
                            ? Text(
                                DateFormat('yyyy-MM-dd').format(selectedDate))
                            : const SizedBox(),
                      ],
                    )),
              ),
              const SizedBox(height: 40),
              MaterialButton(
                onPressed: () {

                  if(textSerNum.text.toString().length > 4 && boolSelected) {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => PhotoDiverLicense(
                            serNums: textSerNum.text.toString(),
                            yyyyMMDs1: DateFormat('yyyy-MM-dd').format(selectedDate).toString(),
                          ),
                        ));
                  }else{

                    if(textSerNum.text.length > 4 && !boolSelected){
                      _selectDate(context);
                    }else{
                      MyWidgets.snackBarMyWidgets(context: context, text: "Maydonlarni to'ldiring");
                    }

                  }
                },
                height: 55,
                minWidth: double.infinity,
                color: AppColors.colorBackground,
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.grey)),
                child: const Text("Davom etish",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }

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

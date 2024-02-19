import 'package:conx/scefics/drivers/cargo_transport/car_ton_weight/controller_car_ton.dart';
import 'package:conx/widgets/app_colors.dart';
import 'package:conx/widgets/saved_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CarTonWeightVolume extends ConsumerStatefulWidget {
  const CarTonWeightVolume({super.key});

  @override
  ConsumerState<CarTonWeightVolume> createState() => _CarTonWeightVolumeState();
}

class _CarTonWeightVolumeState extends ConsumerState<CarTonWeightVolume> {
  TextEditingController txtM1 = TextEditingController();
  TextEditingController txtM2 = TextEditingController();
  TextEditingController txtM3 = TextEditingController();
  TextEditingController txtM4 = TextEditingController();

  var box = HiveBoxes();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Container(
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Сколько тонн вы можете загрузить в свой автомобиль?",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                SizedBox(height: 40),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.44,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("От"),
                          SizedBox(height: 4),
                          TextFormField(
                            controller: txtM1,
                            maxLines: 1,
                            maxLength: 3,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                counter: const SizedBox.shrink(),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Colors.transparent)),
                                disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Colors.transparent)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(10)),
                                hoverColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: Colors.grey.shade200)),
                                fillColor: Colors.grey.shade200,
                                filled: true),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.44,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("До"),
                          SizedBox(height: 4),
                          TextFormField(
                            controller: txtM2,
                            keyboardType: TextInputType.number,
                            maxLines: 1,
                            maxLength: 3,
                            decoration: InputDecoration(
                                counter: SizedBox.shrink(),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Colors.transparent)),
                                disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Colors.transparent)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(10)),
                                hoverColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: Colors.grey.shade200)),
                                fillColor: Colors.grey.shade200,
                                filled: true),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Text("Объём м³"),
                SizedBox(height: 4),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.44,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("От"),
                          SizedBox(height: 4),
                          TextFormField(
                            controller: txtM3,
                            keyboardType: TextInputType.number,
                            maxLines: 1,
                            maxLength: 3,
                            decoration: InputDecoration(
                                counter: SizedBox.shrink(),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Colors.transparent)),
                                disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Colors.transparent)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(10)),
                                hoverColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: Colors.grey.shade200)),
                                fillColor: Colors.grey.shade200,
                                filled: true),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.44,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("До"),
                          SizedBox(height: 4),
                          TextFormField(
                            controller: txtM4,
                            keyboardType: TextInputType.number,
                            maxLines: 1,
                            maxLength: 3,
                            decoration: InputDecoration(
                                counter: SizedBox.shrink(),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Colors.transparent)),
                                disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Colors.transparent)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(10)),
                                hoverColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: Colors.grey.shade200)),
                                fillColor: Colors.grey.shade200,
                                filled: true),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                MaterialButton(
                  onPressed: () {
                    if (txtM1.text.isNotEmpty &&
                        txtM2.text.isNotEmpty &&
                        txtM3.text.isNotEmpty &&
                        txtM4.text.isNotEmpty) {
                      box.modelCarTonsFrom = txtM1.text.toString();
                      box.modelCarTonsTo = txtM2.text.toString();
                      box.modelCarVolumeFrom = txtM3.text.toString();
                      box.modelCarVolumeTo = txtM4.text.toString();

                      ref
                          .read(controllerCarWeightAndVolume.notifier)
                          .setData(context: context);
                    } else {}
                  },
                  height: 50,
                  minWidth: double.infinity,
                  color: AppColors.colorBackground,
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.grey)),
                  child: const Text("Davom etish",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white)),
                ),
              ]),
        ),
      )),
    );
  }

  DateTime selectedDate = DateTime.now();
  bool boolSelected = false;

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

import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:conx/scefics/drivers/tex_car/controller_tex.dart';
import 'package:conx/scefics/drivers/tex_car/widgets/photo_tex_car.dart';
import 'package:conx/widgets/app_colors.dart';
import 'package:conx/widgets/saved_box.dart';
import 'package:conx/widgets/widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TextCarEnterInfo extends ConsumerStatefulWidget {
  const TextCarEnterInfo({super.key});

  @override
  ConsumerState<TextCarEnterInfo> createState() => _TextCarEnterInfoState();
}

class _TextCarEnterInfoState extends ConsumerState<TextCarEnterInfo> {
  var box =HiveBoxes();
  String txtCountryText = "";
  String txtCountyCode = "";
  TextEditingController txt1 = TextEditingController();
  TextEditingController txt2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Container(
        margin: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Какой у машины госномер?",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              const SizedBox(height: 20),
              const Text("Страна"),
              const SizedBox(height: 5),
              GestureDetector(
                onTap: () {
                  getCountryList();
                },
                child: Container(
                  height: 60,
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        txtCountryText,
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text("Гос номер"),
              const SizedBox(height: 5),
              SizedBox(
                height: 60,
                child: TextFormField(
                  controller: txt1,
                  maxLines: 1,
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
              const Text("Гос номер прицеп"),
              const SizedBox(height: 5),
              SizedBox(
                height: 60,
                child: TextFormField(
                  controller: txt2,
                  maxLines: 1,
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
              const SizedBox(height: 40),
              MaterialButton(
                onPressed: () {
                  if (txtCountryText.isNotEmpty &&
                      txt1.text.isNotEmpty &&
                      txt2.text.isNotEmpty) {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => PhotoTexCar(
                            countryCode: txtCountyCode.toString(),
                            serialNumber: "${txt1.text} ${txt2.text}",
                          ),
                        ));
                  } else {
                    log(box.userToken);
                    MyWidgets.snackBarMyWidgets(
                        context: context, text: "Maydonlarni to'ldiring");
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
      )),
    );
  }

  getCountryList() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.6,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
                child: Text("region".tr(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20)),
              ),
              Consumer(
                builder: (context, ref, child) {
                  return ref.watch(controllerTexCar).boolGetData
                      ? Expanded(
                          child: ListView.builder(
                          itemCount: ref
                              .watch(controllerTexCar.notifier)
                              .listModelCountry
                              .length,
                          itemBuilder: (context, index) => Column(
                            children: [
                              const Divider(),
                              ListTile(
                                onTap: () {
                                  txtCountryText = ref
                                      .watch(controllerTexCar.notifier)
                                      .listModelCountry[index]
                                      .name
                                      .toString();
                                  txtCountyCode = ref
                                      .watch(controllerTexCar.notifier)
                                      .listModelCountry[index]
                                      .id
                                      .toString();
                                  setState(() {});
                                  Navigator.of(context).pop();
                                },
                                leading: CachedNetworkImage(
                                  imageUrl: ref
                                      .watch(controllerTexCar.notifier)
                                      .listModelCountry[index]
                                      .flagImg
                                      .toString(),
                                  height: 36,
                                  width: 36,
                                  fit: BoxFit.cover,
                                  errorWidget: (context, url, error) {
                                    return const Icon(Icons.language);
                                  },
                                ),
                                title: Text(ref
                                    .watch(controllerTexCar.notifier)
                                    .listModelCountry[index]
                                    .name
                                    .toString()),
                              ),
                            ],
                          ),
                        ))
                      : const Center(
                          child: CupertinoActivityIndicator(),
                        );
                },
              )
            ]),
      ),
    );
  }
}

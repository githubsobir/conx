import 'dart:io';

import 'package:conx/scefics/drivers/driver_registration/driver_reg.dart';
import 'package:conx/widgets/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChooseDirects extends StatefulWidget {
  const ChooseDirects({super.key});

  @override
  State<ChooseDirects> createState() => _ChooseDirectsCustomerState();
}

class _ChooseDirectsCustomerState extends State<ChooseDirects> {
  late File _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
          child: Container(
        margin: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Yo'nalishlarni tanlang",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              const SizedBox(height: 30),
              const Text("Hudud"),
              Card(
                  color: Colors.white,
                  child: ListTile(
                    onTap: () {
                      shwModalBottomSheet(context: context);
                    },
                    leading: const Text("Hudud tanlang"),
                    trailing: const Icon(Icons.keyboard_arrow_down_outlined),
                  )),
              SizedBox(
                height: 40,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Icon(
                    Icons.arrow_upward,
                    size: 20,
                    color: Colors.grey.shade700,
                  ),
                  Icon(
                    Icons.arrow_downward_sharp,
                    size: 20,
                    color: Colors.grey.shade700,
                  )
                ]),
              ),
              Card(
                  color: Colors.white,
                  child: ListTile(
                    onTap: () {
                      shwModalBottomSheet(context: context);
                    },
                    leading: const Text("Hudud tanlang"),
                    trailing: const Icon(Icons.keyboard_arrow_down_outlined),
                  )),
              const SizedBox(height: 30),
              MaterialButton(
                onPressed: () async {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => DrawerRegistration(),
                      ));
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
              const Expanded(
                  child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Akkauntingiz bormi? Kirish",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ))
            ],
          ),
        ),
      )),
    );
  }

  shwModalBottomSheet({required BuildContext context}) {
    showModalBottomSheet(
        context: context,
        builder: (context) => Container(
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width,
            child: Container(
                margin: const EdgeInsets.all(15),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      const Text(
                        "Hudud",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: 18,
                          itemBuilder: (context, index) => Row(
                            children: [
                              Checkbox(
                                value: false,
                                onChanged: (bool? newValue) {},
                              ),
                              Text("Hudud"),
                            ],
                          ),
                        ),
                      )
                    ]))));
  }
}

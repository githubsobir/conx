import 'package:conx/scefics/drivers/driver_registration/driver_license/photo_driver_license.dart';
import 'package:conx/widgets/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DriverLicense extends StatefulWidget {
  const DriverLicense({super.key});

  @override
  State<DriverLicense> createState() => _DriverLicenseState();
}

class _DriverLicenseState extends State<DriverLicense> {
  TextEditingController textSer = TextEditingController();
  TextEditingController textNum = TextEditingController();

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
          margin: EdgeInsets.all(20),
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
                  controller: textSer,
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
              SizedBox(
                height: 60,
                child: TextFormField(
                  controller: textNum,
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
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => PhotoDiverLicense(),
                      ));
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
}

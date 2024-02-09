import 'dart:developer';
import 'package:conx/scefics/drivers/driver_registration/driver_license/controller_license.dart';
import 'package:conx/scefics/drivers/driver_registration/driver_license/widgets/photo_license1.dart';
import 'package:conx/scefics/drivers/driver_registration/driver_license/widgets/photo_license2.dart';
import 'package:conx/scefics/drivers/driver_registration/driver_license/widgets/photo_license3.dart';
import 'package:conx/widgets/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PhotoDiverLicense extends ConsumerStatefulWidget{
  const PhotoDiverLicense({super.key});

  @override
  ConsumerState<PhotoDiverLicense> createState() => _PhotoDiverLicenseState();
}

class _PhotoDiverLicenseState extends ConsumerState<PhotoDiverLicense> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(15),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
           const Padding(
              padding:  EdgeInsets.only(left: 20, bottom: 5),
              child:  Text(
                "Фотография документа",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 20),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox.shrink(),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context,CupertinoPageRoute(builder: (context) => PhotoLicense1(),));
                  },
                  child: Container(
                    height: 104,
                    width: MediaQuery.of(context).size.width * 0.4,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.photo_camera_outlined),
                          SizedBox(height: 10),
                          Text(
                            "Лицевая сторона",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context,CupertinoPageRoute(builder: (context) => PhotoLicense2(),));
                  },
                  child: Container(
                    height: 104,
                    width: MediaQuery.of(context).size.width * 0.4,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.photo_camera_outlined),
                          SizedBox(height: 10),
                          Text(
                            "Обратная сторона",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox.shrink(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: GestureDetector(
                onTap: (){
                    Navigator.push(context,CupertinoPageRoute(builder: (context) => PhotoLicense3(),));
                },
                child: Container(
                  height: 104,
                  width: MediaQuery.of(context).size.width * 0.4,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.photo_camera_outlined),
                        SizedBox(height: 10),
                        Text(
                          "Фотография лица на фоне документа",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MaterialButton(
                  onPressed: () {
                    ref.read(controllerDriverLicense.notifier).setDriverLicense();
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
            )),
          ]),
        ),
      ),
    );
  }
}

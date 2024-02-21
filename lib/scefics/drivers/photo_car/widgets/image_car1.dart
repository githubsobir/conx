import 'dart:developer';
import 'package:conx/scefics/drivers/photo_car/controller_car_photo.dart';
import 'package:conx/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PhotoCarPhoto1 extends ConsumerStatefulWidget {
  PhotoCarPhoto1({super.key});

  @override
  ConsumerState<PhotoCarPhoto1> createState() => _PhotoCarPhoto1State();
}

class _PhotoCarPhoto1State extends ConsumerState<PhotoCarPhoto1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        actions: [
          GestureDetector(
            onTap: () {
              try {
                ref.read(controllerCarPhoto6.notifier).file1.path.length > 10
                    ? {Navigator.of(context).pop(),
                  ref.read(controllerCarPhoto6.notifier).setDefault()
                }
                    : {};
              } catch (e) {
                log(e.toString());
              }
            },
            child:const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Icon(
                Icons.check,
                color: Colors.white,
              ),
            ),
          )
        ],
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body:
      ref.watch(controllerCarPhoto6).boolGetData?
      SafeArea(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    ref.read(controllerCarPhoto6.notifier).getImageCamera(0);
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                        )),
                    child: getDataFile() == "1"
                        ? Image.file(ref.watch(controllerCarPhoto6.notifier).file1)
                        : const Icon(Icons.image,
                        size: 50, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 40),
                const Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Лицевая сторона",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.start),
                        SizedBox(height: 20),
                        Text(
                            "Добейтес совпадения ИД карты с рамкой.\nУбедитес что:",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.normal),
                            textAlign: TextAlign.start),
                        SizedBox(height: 20),
                        Text("-ИД карта хорошо освещена",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.normal),
                            textAlign: TextAlign.start),
                        Text("ИД карта не перекрывается пальцем",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.normal),
                            textAlign: TextAlign.start),
                        Text("-Отсутствуют блики",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.normal),
                            textAlign: TextAlign.start),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 30),
                MaterialButton(
                  onPressed: () {
                    ref.read(controllerCarPhoto6.notifier).getImageCamera(0);
                  },
                  height: 55,
                  minWidth: double.infinity,
                  color: AppColors.colorBackground,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    "Сделать фото",
                  ),
                ),
                const SizedBox(height: 25),
                MaterialButton(
                  onPressed: () {
                    ref.read(controllerCarPhoto6.notifier).getImage(0);
                  },
                  height: 55,
                  minWidth: double.infinity,
                  color: AppColors.colorBackground,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: const Text(
                    "Галерея фото",
                  ),
                )
              ],
            ),
          ),
        ),
      ):const Center(child: CupertinoActivityIndicator()),
    );
  }
  String getDataFile(){
    try{
      return ref.watch(controllerCarPhoto6.notifier).file1.path.length >= 10?"1":"0";
    }catch(e){
      return "0";
    }
  }
}

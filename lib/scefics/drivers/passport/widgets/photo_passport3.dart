import 'dart:developer';

import 'package:conx/scefics/drivers/passport/controller_passport.dart';
import 'package:conx/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PhotoPassport3 extends ConsumerStatefulWidget {
  const PhotoPassport3({super.key});

  @override
  ConsumerState<PhotoPassport3> createState() => _PhotoPassport3State();
}

class _PhotoPassport3State extends ConsumerState<PhotoPassport3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          GestureDetector(
            onTap: () {
              try {
                ref.read(controllerPassport.notifier).file3.path.length > 10
                    ? {Navigator.of(context).pop(),
                  ref.read(controllerPassport.notifier).setDeafault()
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

      ),
      body:
      ref.watch(controllerPassport).boolGetData?
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
                    ref.read(controllerPassport.notifier).getImageCamera(2);
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                        )),
                    child: getDataFile() =="1"
                        ? Image.file(
                      ref.watch(controllerPassport.notifier).file3)
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
                        Text("Обратная сторона",
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
                    ref.read(controllerPassport.notifier).getImageCamera(2);
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
                    ref.read(controllerPassport.notifier).getImage(2);
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
      ):Center(child: CupertinoActivityIndicator(),),
    );
  }
  String getDataFile(){
    try{
      return ref.watch(controllerPassport.notifier).file3.path.length >= 10?"1":"0";
    }catch(e){
      return "0";
    }
  }
}

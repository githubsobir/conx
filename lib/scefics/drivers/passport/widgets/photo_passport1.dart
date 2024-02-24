import 'dart:developer';

import 'package:conx/scefics/drivers/passport/controller_passport.dart';
import 'package:conx/scefics/drivers/passport/passport.dart';
import 'package:conx/theme/app_colors.dart';
import 'package:conx/widgets/background_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PhotoPassport1 extends ConsumerStatefulWidget {
  const PhotoPassport1({super.key});

  @override
  ConsumerState<PhotoPassport1> createState() => _PhotoPassport1State();
}

class _PhotoPassport1State extends ConsumerState<PhotoPassport1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.background,
        actions: [
          GestureDetector(
            onTap: () {
              try {
                ref.read(controllerPassport.notifier).file1.path.length > 10
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
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body:

      Stack(
        children: [
          const BackgroundWidget(),
          Column(children:[
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
                        ref.read(controllerPassport.notifier).getImageCamera(0);
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: AppColors.white100,
                        )),
                        child: getImage(ref, 0) == "1"
                            ? Image.file(ref.watch(controllerPassport.notifier).file1)
                            :  Icon(Icons.image,
                                size: 50, color:AppColors.white100),
                      ),
                    ),
                    const SizedBox(height: 40),
                     Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Лицевая сторона",
                                style: TextStyle(
                                    color: AppColors.white100,
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
                        ref.read(controllerPassport.notifier).getImageCamera(0);
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
                        ref.read(controllerPassport.notifier).getImage(0);
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
          ):const Center(child: CupertinoActivityIndicator())]),
        ],
      ),
    );
  }
}

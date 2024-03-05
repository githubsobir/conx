import 'dart:developer';

import 'package:conx/scefics/drivers/photo_car/controller_car_photo.dart';
import 'package:conx/theme/app_colors.dart';
import 'package:conx/widgets/background_widget.dart';
import 'package:conx/widgets/primary_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PhotoCarPhoto1 extends ConsumerStatefulWidget {
  const PhotoCarPhoto1({super.key});

  @override
  ConsumerState<PhotoCarPhoto1> createState() => _PhotoCarPhoto1State();
}

class _PhotoCarPhoto1State extends ConsumerState<PhotoCarPhoto1> {
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
                  ref.read(controllerCarPhoto6.notifier).file1.path.length > 10
                      ? {
                          Navigator.of(context).pop(),
                          ref.read(controllerCarPhoto6.notifier).setDefault()
                        }
                      : {};
                } catch (e) {
                  log(e.toString());
                }
              },
              child: const Padding(
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
        body: Stack(
          children: [
            const BackgroundWidget(),
            ref.watch(controllerCarPhoto6).boolGetData
                ? SafeArea(
                    child: Container(
                      margin: const EdgeInsets.all(20),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                ref
                                    .read(controllerCarPhoto6.notifier)
                                    .getImageCamera(0);
                              },
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                width: MediaQuery.of(context).size.width * 0.9,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                  color: AppColors.white100,
                                )),
                                child: getDataFile() == "1"
                                    ? Image.file(ref
                                        .watch(controllerCarPhoto6.notifier)
                                        .file1)
                                    : Icon(Icons.image,
                                        size: 50, color: AppColors.white100),
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
                                    const SizedBox(height: 20),
                                    Text(
                                        "Добейтес совпадения ИД карты с рамкой.\nУбедитес что:",
                                        style: TextStyle(
                                            color: AppColors.white100,
                                            fontWeight: FontWeight.normal),
                                        textAlign: TextAlign.start),
                                    const SizedBox(height: 20),
                                    Text("-ИД карта хорошо освещена",
                                        style: TextStyle(
                                            color: AppColors.white100,
                                            fontWeight: FontWeight.normal),
                                        textAlign: TextAlign.start),
                                    Text("ИД карта не перекрывается пальцем",
                                        style: TextStyle(
                                            color: AppColors.white100,
                                            fontWeight: FontWeight.normal),
                                        textAlign: TextAlign.start),
                                    Text("-Отсутствуют блики",
                                        style: TextStyle(
                                            color: AppColors.white100,
                                            fontWeight: FontWeight.normal),
                                        textAlign: TextAlign.start),
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(height: 30),
                            PrimaryButton(
                                onPressed: () {
                                  ref
                                      .read(controllerCarPhoto6.notifier)
                                      .getImageCamera(0);
                                },
                                text: "Сделать фото"),
                            const SizedBox(height: 25),
                            PrimaryButton(
                                onPressed: () {
                                  ref
                                      .read(controllerCarPhoto6.notifier)
                                      .getImage(0);
                                },
                                text: "Галерея фото")
                          ],
                        ),
                      ),
                    ),
                  )
                : const Center(child: CupertinoActivityIndicator()),
          ],
        ));
  }

  String getDataFile() {
    try {
      return ref.watch(controllerCarPhoto6.notifier).file1.path.length >= 10
          ? "1"
          : "0";
    } catch (e) {
      return "0";
    }
  }
}

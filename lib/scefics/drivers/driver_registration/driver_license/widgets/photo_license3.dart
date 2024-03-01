import 'package:conx/scefics/drivers/driver_registration/driver_license/controller_license.dart';
import 'package:conx/theme/app_colors.dart';
import 'package:conx/widgets/background_widget.dart';
import 'package:conx/widgets/primary_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PhotoLicense3 extends ConsumerStatefulWidget {
  const PhotoLicense3({super.key});

  @override
  ConsumerState<PhotoLicense3> createState() => _PhotoLicense3State();
}

class _PhotoLicense3State extends ConsumerState<PhotoLicense3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.background,
          iconTheme: IconThemeData(color: AppColors.white100),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: IconButton(
                icon: Icon(Icons.check, color: AppColors.white100),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            )
          ],
        ),
        body: Stack(
          children: [
            const BackgroundWidget(),
            ref.watch(controllerDriverLicense).boolGetData
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
                                    .read(controllerDriverLicense.notifier)
                                    .getImageCamera(2);
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
                                        .watch(controllerDriverLicense.notifier)
                                        .file3)
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
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.9,
                                      child: Text(
                                          "Фотография лица на фоне документа",
                                          style: TextStyle(
                                              color: AppColors.white100,
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.start),
                                    ),
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
                                    .read(controllerDriverLicense.notifier)
                                    .getImageCamera(2);
                              },
                              text: "Сделать фото",
                            ),
                            const SizedBox(height: 25),
                            PrimaryButton(
                              onPressed: () {
                                ref
                                    .read(controllerDriverLicense.notifier)
                                    .getImage(2);
                              },
                              text: "Галерея фото",
                            )
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
      return ref.watch(controllerDriverLicense.notifier).file3.path.length >= 10
          ? "1"
          : "0";
    } catch (e) {
      return "0";
    }
  }
}

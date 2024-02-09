import 'package:conx/scefics/drivers/driver_registration/driver_license/controller_license.dart';

import 'package:conx/widgets/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PhotoLicense1 extends ConsumerStatefulWidget {
  const PhotoLicense1({super.key});

  @override
  ConsumerState<PhotoLicense1> createState() => _PhotoLicense1State();
}

class _PhotoLicense1State extends ConsumerState<PhotoLicense1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    ref.read(controllerDriverLicense.notifier).getImageCamera(0);
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: Colors.white,
                    )),
                    child: ref
                        .watch(controllerDriverLicense)
                        .list.isNotEmpty

                        ? Image.file(
                        ref.watch(controllerDriverLicense).list[0])
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
                  onPressed: () {},
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
                    ref.read(controllerDriverLicense.notifier).getImage(0);
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
      ),
    );
  }
}

import 'package:conx/scefics/drivers/driver_registration/driver_license/controller_license.dart';
import 'package:conx/scefics/drivers/driver_registration/driver_license/mini_controller.dart';
import 'package:conx/widgets/app_colors.dart';
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
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              icon: const Icon(Icons.check, color: Colors.white),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          )
        ],
      ),
      body:
      ref.watch(controllerDriverLicense).boolGetData?
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
                    ref
                        .read(controllerDriverLicense.notifier)
                        .getImageCamera(2);
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: Colors.white,
                    )),
                    child: getDataFile() == "1"
                        ? Image.file(ref.watch(controllerDriverLicense.notifier).file3)
                        : const Icon(Icons.image,
                            size: 50, color: Colors.white),
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
                          width: MediaQuery.of(context).size.width*0.9,
                          child: const Text("Фотография лица на фоне документа",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.start),
                        ),
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
                    ref
                        .read(controllerDriverLicense.notifier)
                        .getImageCamera(2);
                  },
                  height: 55,
                  minWidth: double.infinity,
                  color: AppColors.colorBackground,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: const Text(
                    "Сделать фото",
                  ),
                ),
                const SizedBox(height: 25),
                MaterialButton(
                  onPressed: () {
                    ref.read(controllerDriverLicense.notifier).getImage(2);
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
      ):Center(child: CupertinoActivityIndicator()),
    );
  }
  String getDataFile(){
    try{
      return ref.watch(controllerDriverLicense.notifier).file3.path.length >= 10?"1":"0";
    }catch(e){
      return "0";
    }
  }
}

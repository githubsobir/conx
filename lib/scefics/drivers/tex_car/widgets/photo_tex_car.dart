import 'package:conx/scefics/drivers/photo_car/photo_car_driver.dart';
import 'package:conx/scefics/drivers/tex_car/controller_tex.dart';
import 'package:conx/scefics/drivers/tex_car/widgets/photo_tex_car1.dart';
import 'package:conx/scefics/drivers/tex_car/widgets/photo_tex_car2.dart';
import 'package:conx/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PhotoTexCar extends ConsumerStatefulWidget {
  String countryCode;
  String serialNumber;

  PhotoTexCar(
      {super.key, required this.countryCode, required this.serialNumber});

  @override
  ConsumerState<PhotoTexCar> createState() => _PhotoTexCarState();
}

class _PhotoTexCarState extends ConsumerState<PhotoTexCar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: ref.watch(controllerTexCar).boolGetData
          ? SafeArea(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20, bottom: 5),
                  child: Text(
                    "Фотография тех. и прицеп паспорта",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 30),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox.shrink(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => const PhotoTexCar1(),
                            ));
                      },
                      child: getDataFile(0, ref) == "1"
                          ? Image.file(
                              ref.watch(controllerTexCar.notifier).file1,
                              height: 104,
                              width: MediaQuery.of(context).size.width * 0.4,
                              fit: BoxFit.cover,
                            )
                          : Container(
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
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600),
                                    )
                                  ],
                                ),
                              ),
                            ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => const PhotoTexCar2(),
                            ));
                      },
                      child: getDataFile(1, ref) == "1"
                          ? Image.file(
                              ref.watch(controllerTexCar.notifier).file2,
                              height: 104,
                              width: MediaQuery.of(context).size.width * 0.4,
                              fit: BoxFit.cover,
                            )
                          : Container(
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
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600),
                                    )
                                  ],
                                ),
                              ),
                            ),
                    ),
                    const SizedBox.shrink(),
                  ],
                ),
                const SizedBox(height: 20),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        ref.read(controllerTexCar.notifier).setTexCarServer
                          (country1: widget.countryCode, serNum: widget.serialNumber);
                        Navigator.push(context, CupertinoPageRoute(builder: (context) => PhotoCarDriver(),));
                      },
                      height: 55,
                      minWidth: double.infinity,
                      color: AppColors.colorBackground,
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.grey)),
                      child: const Text("Davom etish",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ),
                  ],
                )),
                const SizedBox(height: 20),
              ],
            ))
          : const Center(child: CupertinoActivityIndicator()),
    );
  }

  String getDataFile(int index, WidgetRef ref) {
    try {
      return index == 0
          ? ref.watch(controllerTexCar.notifier).file1.path.length >= 10
              ? "1"
              : "0"
          : ref.watch(controllerTexCar.notifier).file2.path.length >= 10
              ? "1"
              : "0";
    } catch (e) {
      return "0";
    }
  }
}

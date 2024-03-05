import 'package:conx/scefics/drivers/photo_car/controller_car_photo.dart';
import 'package:conx/scefics/drivers/photo_car/widgets/image_car1.dart';
import 'package:conx/scefics/drivers/photo_car/widgets/image_car2.dart';
import 'package:conx/scefics/drivers/photo_car/widgets/image_car3.dart';
import 'package:conx/scefics/drivers/photo_car/widgets/image_car4.dart';
import 'package:conx/scefics/drivers/photo_car/widgets/image_car5.dart';
import 'package:conx/theme/app_colors.dart';
import 'package:conx/widgets/background_widget.dart';
import 'package:conx/widgets/primary_button.dart';
import 'package:conx/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PhotoCarDriver extends ConsumerStatefulWidget {
  const PhotoCarDriver({super.key});

  @override
  ConsumerState<PhotoCarDriver> createState() => _PhotoCarDriverState();
}

class _PhotoCarDriverState extends ConsumerState<PhotoCarDriver> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.background,
          iconTheme: IconThemeData(color: AppColors.white100),
        ),
        body: Stack(
          children: [
            const BackgroundWidget(),
            ref.watch(controllerCarPhoto6).boolGetData
                ? SafeArea(
                    child: SafeArea(
                        child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, bottom: 5),
                        child: Text(
                          "Фотография транспорта",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.white100,
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
                                    builder: (context) => PhotoCarPhoto1(),
                                  ));
                            },
                            child: getImage(ref, 0) == "1"
                                ? Image.file(
                                    ref
                                        .watch(controllerCarPhoto6.notifier)
                                        .file1,
                                    fit: BoxFit.cover,
                                    height: 104,
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                  )
                                : Container(
                                    height: 104,
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    padding: const EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade300,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: const Center(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.photo_camera_outlined),
                                          SizedBox(height: 10),
                                          Text(
                                            "Автомобиль спереди",
                                            textAlign: TextAlign.center,
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
                                    builder: (context) => PhotoCarPhoto2(),
                                  ));
                            },
                            child: getImage(ref, 1) == "1"
                                ? Image.file(
                                    ref
                                        .watch(controllerCarPhoto6.notifier)
                                        .file2,
                                    fit: BoxFit.cover,
                                    height: 104,
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                  )
                                : Container(
                                    height: 104,
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    padding: const EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade300,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: const Center(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.photo_camera_outlined),
                                          SizedBox(height: 10),
                                          Text(
                                            "Автомобиль слева",
                                            textAlign: TextAlign.center,
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
                                    builder: (context) => PhotoCarPhoto3(),
                                  ));
                            },
                            child: getImage(ref, 2) == "1"
                                ? Image.file(
                                    ref
                                        .watch(controllerCarPhoto6.notifier)
                                        .file3,
                                    fit: BoxFit.cover,
                                    height: 104,
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                  )
                                : Container(
                                    height: 104,
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    padding: const EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade300,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: const Center(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.photo_camera_outlined),
                                          SizedBox(height: 10),
                                          Text(
                                            "Автомобиль сзади",
                                            textAlign: TextAlign.center,
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
                                    builder: (context) => PhotoCarPhoto4(),
                                  ));
                            },
                            child: getImage(ref, 3) == "1"
                                ? Image.file(
                                    ref
                                        .watch(controllerCarPhoto6.notifier)
                                        .file4,
                                    fit: BoxFit.cover,
                                    height: 104,
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                  )
                                : Container(
                                    height: 104,
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    padding: const EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade300,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: const Center(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.photo_camera_outlined),
                                          SizedBox(height: 10),
                                          Text(
                                            "Автомобиль справа",
                                            textAlign: TextAlign.center,
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
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => PhotoCarPhoto5(),
                              ));
                        },
                        child: getImage(ref, 4) == "1"
                            ? Container(
                                padding: const EdgeInsets.all(15),
                                margin: const EdgeInsets.only(left: 20),
                                child: Image.file(
                                  ref.watch(controllerCarPhoto6.notifier).file5,
                                  fit: BoxFit.cover,
                                  height: 104,
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                ),
                              )
                            : Container(
                                height: 104,
                                width: MediaQuery.of(context).size.width * 0.4,
                                padding: const EdgeInsets.all(15),
                                margin: const EdgeInsets.only(left: 30),
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(10)),
                                child: const Center(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.photo_camera_outlined),
                                      SizedBox(height: 10),
                                      Text(
                                        "Внутри прицеп",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                      ),
                      const Spacer(),
                      Container(
                        margin: const EdgeInsets.all(20),
                        child: PrimaryButton(
                            onPressed: () {
                              if (checkAllFile()) {
                                /// sent server
                                ref
                                    .read(controllerCarPhoto6.notifier)
                                    .setData();
                              } else {
                                MyWidgets.snackBarMyWidgets(
                                    context: context,
                                    text: "Barcha rasmlarni kiriting");
                              }
                            },
                            text: "Готово"),
                      ),
                      const SizedBox(height: 20),
                    ],
                  )))
                : const Center(
                    child: CupertinoActivityIndicator(),
                  ),
          ],
        ));
  }

  bool checkAllFile() {
    bool checker = true;
    for (int i = 0; i < 5; i++) {
      if (getImage(ref, i) != "1") {
        checker = false;
      }
    }
    return checker;
  }

  String getImage(WidgetRef ref, int index) {
    try {
      if (index == 0) {
        return ref.watch(controllerCarPhoto6.notifier).file1.path.length > 12
            ? "1"
            : "0";
      } else if (index == 1) {
        return ref.watch(controllerCarPhoto6.notifier).file2.path.length > 12
            ? "1"
            : "0";
      } else if (index == 2) {
        return ref.watch(controllerCarPhoto6.notifier).file3.path.length > 12
            ? "1"
            : "0";
      } else if (index == 3) {
        return ref.watch(controllerCarPhoto6.notifier).file4.path.length > 12
            ? "1"
            : "0";
      } else {
        return ref.watch(controllerCarPhoto6.notifier).file5.path.length > 12
            ? "1"
            : "0";
      }
    } catch (e) {
      return "0";
    }
  }
}

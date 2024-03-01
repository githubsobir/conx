import 'package:conx/scefics/drivers/driver_registration/driver_license/controller_license.dart';
import 'package:conx/scefics/drivers/driver_registration/driver_license/widgets/photo_license1.dart';
import 'package:conx/scefics/drivers/driver_registration/driver_license/widgets/photo_license2.dart';
import 'package:conx/scefics/drivers/driver_registration/driver_license/widgets/photo_license3.dart';
import 'package:conx/theme/app_colors.dart';
import 'package:conx/widgets/background_widget.dart';
import 'package:conx/widgets/primary_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PhotoDiverLicense extends ConsumerStatefulWidget {
  String yyyyMMDs1;
  String serNums;

  PhotoDiverLicense(
      {super.key, required this.yyyyMMDs1, required this.serNums});

  @override
  ConsumerState<PhotoDiverLicense> createState() => _PhotoDiverLicenseState();
}

class _PhotoDiverLicenseState extends ConsumerState<PhotoDiverLicense> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.white100),
        backgroundColor: AppColors.background,
      ),
      body: ref.watch(controllerDriverLicense).boolGetData
          ? Stack(
              children: [
                const BackgroundWidget(),
                SafeArea(
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, bottom: 5),
                            child: Text(
                              "Фотография документа",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.white100,
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
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                        builder: (context) =>
                                            const PhotoLicense1(),
                                      ));
                                },
                                child: getDataFile(0) == "1"
                                    ? Image.file(
                                        ref
                                            .watch(controllerDriverLicense
                                                .notifier)
                                            .file1,
                                        height: 104,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        fit: BoxFit.cover,
                                      )
                                    : Container(
                                        height: 104,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
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
                                                "Лицевая сторона",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w600),
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
                                        builder: (context) =>
                                            const PhotoLicense2(),
                                      ));
                                },
                                child: getDataFile(1) == "1"
                                    ? Image.file(
                                        ref
                                            .watch(controllerDriverLicense
                                                .notifier)
                                            .file2,
                                        height: 104,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        fit: BoxFit.cover,
                                      )
                                    : Container(
                                        height: 104,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
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
                                                "Обратная сторона",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w600),
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
                              onTap: () {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                      builder: (context) =>
                                          const PhotoLicense3(),
                                    ));
                              },
                              child: getDataFile(2) == "1"
                                  ? Image.file(
                                      ref
                                          .watch(
                                              controllerDriverLicense.notifier)
                                          .file3,
                                      height: 104,
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      fit: BoxFit.cover,
                                    )
                                  : Container(
                                      height: 104,
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
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
                                              "Фотография лица на фоне документа",
                                              maxLines: 2,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600),
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
                              PrimaryButton(
                                onPressed: () {
                                  ref
                                      .read(controllerDriverLicense.notifier)
                                      .setDriverLicense(
                                          context: context,
                                          serNum: widget.serNums,
                                          yyyyMMD: widget.yyyyMMDs1);
                                },
                                text: "Davom etish",
                              ),
                            ],
                          )),
                        ]),
                  ),
                ),
              ],
            )
          : const Center(child: CupertinoActivityIndicator()),
    );
  }

  String getDataFile(int index) {
    try {
      if (index == 0) {
        return ref.watch(controllerDriverLicense.notifier).file1.path.length >=
                10
            ? "1"
            : "0";
      } else if (index == 1) {
        return ref.watch(controllerDriverLicense.notifier).file2.path.length >=
                10
            ? "1"
            : "0";
      } else {
        return ref.watch(controllerDriverLicense.notifier).file3.path.length >=
                10
            ? "1"
            : "0";
      }
    } catch (e) {
      return "0";
    }
  }
}

import 'dart:io';

import 'package:conx/pages/active_orders/exporter/controller_exporter.dart';
import 'package:conx/theme/app_colors.dart';
import 'package:conx/widgets/background_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class GetImagesExporter extends ConsumerStatefulWidget {
  const GetImagesExporter({super.key});

  @override
  ConsumerState<GetImagesExporter> createState() => _GetImagesExporterState();
}

class _GetImagesExporterState extends ConsumerState<GetImagesExporter> {
  List<File?> listFile = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundWidget(),
          SafeArea(
              child: Container(
            margin: const EdgeInsets.all(20),
            child: ref.watch(controllerExporter).boolGetData
                ? SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: (){
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                          Platform.isIOS
                              ? Icons.arrow_back_ios
                              : Icons.arrow_back_sharp,
                          color: AppColors.white100,
                        )),
                        const SizedBox(height: 20),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.7,
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            itemCount: 6,
                            itemBuilder: (context, index) => Container(
                              margin: const EdgeInsets.all(5),
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(color: AppColors.white100)),
                              child: getImage(ref, index) == "1"
                                  ? Card(
                                      child: Image.file(
                                          height: 104,
                                          width:
                                              MediaQuery.of(context).size.width *
                                                  0.4,
                                          fit: BoxFit.cover,
                                          getFile(ref, index)),
                                    )
                                  : Container(
                                      height: 104,
                                      width:
                                          MediaQuery.of(context).size.width * 0.4,
                                      padding: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                          color: Colors.grey.shade300,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child:const Center(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(Icons
                                                      .add),
                                                  SizedBox(height: 10),
                                                  Text(
                                                    "File yuklash",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  )
                                                ],
                                              ),
                                            ),
                                    ),
                            ),
                          ),
                        ),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () async {
                                  // ref
                                  //     .read(controllerExporter.notifier)
                                  //     .getImagePhoto(5);
                                  XFile? video = await ImagePicker().pickVideo(
                                    source: ImageSource.camera,
                                  );
                                },
                                icon: Icon(
                                  Icons.photo_camera,
                                  color: AppColors.white100,
                                  size: 55,
                                )),
                            const SizedBox(width: 40),
                            IconButton(
                                onPressed: () async {
                                  final imagePicker = ImagePicker();
                  
                                  final pickedFile = await imagePicker.pickImage(
                                      source: ImageSource.gallery);
                                  listFile.add(File(pickedFile!.path));
                                },
                                icon: Icon(
                                  CupertinoIcons.folder_fill_badge_plus,
                                  color: AppColors.white100,
                                  size: 55,
                                ))
                          ],
                        )
                      ],
                    ),
                )
                : const Center(
                    child: CupertinoActivityIndicator(),
                  ),
          ))
        ],
      ),
    );
  }

  String getImage(WidgetRef ref, int index) {
    try {
      if (index == 0) {
        return ref.watch(controllerExporter.notifier).file0.path.length > 12
            ? "1"
            : "0";
      } else if (index == 1) {
        return ref.watch(controllerExporter.notifier).file1.path.length > 12
            ? "1"
            : "0";
      } else if (index == 2) {
        return ref.watch(controllerExporter.notifier).file2.path.length > 12
            ? "1"
            : "0";
      } else if (index == 3) {
        return ref.watch(controllerExporter.notifier).file3.path.length > 12
            ? "1"
            : "0";
      } else if (index == 4) {
        return ref.watch(controllerExporter.notifier).file4.path.length > 12
            ? "1"
            : "0";
      } else {
        return ref.watch(controllerExporter.notifier).file5.path.length > 12
            ? "1"
            : "0";
      }
    } catch (e) {
      return "0";
    }
  }

  File getFile(WidgetRef ref, int index) {
    try {
      if (index == 0) {
        return ref.watch(controllerExporter.notifier).file0;
      } else if (index == 1) {
        return ref.watch(controllerExporter.notifier).file1;
      } else if (index == 2) {
        return ref.watch(controllerExporter.notifier).file2;
      } else if (index == 3) {
        return ref.watch(controllerExporter.notifier).file3;
      } else if (index == 4) {
        return ref.watch(controllerExporter.notifier).file4;
      } else {
        return ref.watch(controllerExporter.notifier).file5;
      }
    } catch (e) {
      return ref.watch(controllerExporter.notifier).file0;
    }
  }
}

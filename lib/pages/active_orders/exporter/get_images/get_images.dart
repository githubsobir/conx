import 'dart:io';

import 'package:conx/theme/app_colors.dart';
import 'package:conx/widgets/background_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class GetImagesExporter extends StatefulWidget {
  const GetImagesExporter({super.key});

  @override
  State<GetImagesExporter> createState() => _GetImagesExporterState();
}

class _GetImagesExporterState extends State<GetImagesExporter> {
  List<File?> listFile = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
      ),
      body: Stack(
        children: [
          const BackgroundWidget(),
          SafeArea(
              child: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
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
                      color: Colors.green,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                // const Divider(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () async {
                          final imagePicker = ImagePicker();

                          final pickedFile = await imagePicker.pickImage(
                              source: ImageSource.camera);
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
          ))
        ],
      ),
    );
  }
}

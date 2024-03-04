import 'dart:developer';
import 'dart:io';

import 'package:conx/firts_part/login_reg/reg/add_photo/model_add_photo/model_add_photo_reg.dart';
import 'package:conx/firts_part/login_reg/reg/add_row1/add_row.dart';
import 'package:conx/root_and_unver_page/root_page.dart';
import 'package:conx/scefics/drivers/driver_registration/driver_reg.dart';
import 'package:conx/widgets/main_url.dart';
import 'package:conx/widgets/saved_box.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final controllerAddPhotoDriver =
    StateNotifierProvider.autoDispose<ControllerAddPhotoReg, ModelAddPhotoReg>(
        (ref) => ControllerAddPhotoReg());

class ControllerAddPhotoReg extends StateNotifier<ModelAddPhotoReg> {
  ControllerAddPhotoReg()
      : super(ModelAddPhotoReg(statusData: "1", textError: "", note: ""));

  // late File file;
  var dio = Dio();
  var box = HiveBoxes();
  List<File> imageList = [];

  Future getImageFromGallery() async {
    try {
      state = state.copyWith("0", "0", "");
      imageList.clear();
      final imagePicker = ImagePicker();

      final pickedFile =
          await imagePicker.pickImage(source: ImageSource.gallery);
      imageList.add(File(pickedFile!.path));
      state = state.copyWith("1", "1", "");
    } catch (e) {
      state = state.copyWith("1", e.toString(), "");
    }
  }

  var _box = HiveBoxes();

  Future setImageServer({required BuildContext context}) async {
    try {
      state = state.copyWith("0", "0", "");
      FormData formData = FormData.fromMap({
        "image": await MultipartFile.fromFile(imageList[0].path,
            filename: "image_user"),
      });
      Response response = await dio.post(
          "${MainUrl.urlMain}/api/driver/avatar/",
          data: formData,
          options:
              Options(headers: {"Authorization": "Bearer ${box.userToken}"}));

      log(_box.userType);
      log(_box.userType);
      log(_box.userType);
      if(_box.userType == "Driver"){
        Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => const AddRow1( ),
            ));
      }else{
        Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => const RootPage(),
            ));
      }

      state = state.copyWith("1", "", "");
    } on DioException catch (e) {
      try {
        FormData formData = FormData.fromMap({
          "image": await MultipartFile.fromFile(imageList[0].path,
              filename: "image_user"),
        });
        Response response = await dio.patch(
            "${MainUrl.urlMain}/api/driver/avatar-retrieve-update/",
            data: formData,
            options:
                Options(headers: {"Authorization": "Bearer ${box.userToken}"}));
        print("response.statusCode.toString()");
        print(response.statusCode.toString());
        state = state.copyWith("1", "", "");
      } catch (e4) {
        log("e4");
        log(e4.toString());
      }

      Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => const DrawerRegistration( ),
          ));

      state = state.copyWith("1", e.toString(), e.toString());
    }
  }
}

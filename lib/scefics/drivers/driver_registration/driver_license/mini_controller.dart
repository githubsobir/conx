import 'package:conx/scefics/drivers/driver_registration/driver_license/controller_license.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final listControllerLicense =
StateProvider.family<String, int>((ref, index) {

  try {
    if (index == 1) {
      return ref.watch(controllerDriverLicense).list[0].path.isNotEmpty
          ? "1"
          : "0";
    } else if (index == 2) {
      return ref.watch(controllerDriverLicense).list[1].path.isNotEmpty
          ? "1"
          : "0";
    } else {
      return "1";
    }
  } catch (e) {
    return "0";
  }
});
////

final listControllerLicenseMini =
StateProvider.family<String, int>((ref, index) {

  try {
    if (index == 0) {
      return ref.watch(controllerDriverLicense).list[0].path.isNotEmpty
          ? "1"
          : "0";
    }
    else if (index == 1) {
      return ref.watch(controllerDriverLicense).list.length <= 2
          ? "1"
          : "0";
    } else if (index == 2) {
      return ref.watch(controllerDriverLicense).list.length <= 3
          ? "1"
          : "0";
    } else {
      return "-";
    }
  } catch (e) {
    return "0";
  }
});
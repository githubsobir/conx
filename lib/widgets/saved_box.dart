import 'dart:developer';

import 'package:hive/hive.dart';

class HiveBoxes {
  var box = Hive.box("sanx");

  // Hive box
  // 1 til tanlangani

  set langUser(String chooseLang) {
    try {
      box.delete("langUser");
      box.put("langUser", chooseLang);
    } catch (e) {
      log(e.toString());
    }
  }

  String get langUser {
    try {
      return box.get("langUser");
    } catch (e) {
      log(e.toString());
      return "-1";
    }
  }

  // 2 tanlangan til
  set langUserLang(String chooseLang) {
    try {
      box.delete("langUserLang");
      box.put("langUserLang", chooseLang);
    } catch (e) {
      log(e.toString());
    }
  }

  String get langUserLang {
    try {
      return box.get("langUserLang");
    } catch (e) {
      log(e.toString());
      return "-1";
    }
  }

  set langFulName(String chooseLang) {
    try {
      box.delete("langFulName");
      box.put("langFulName", chooseLang);
    } catch (e) {
      log(e.toString());
    }
  }

  String get langFulName {
    try {
      return box.get("langFulName");
    } catch (e) {
      log(e.toString());
      return "O'zbek tili";
    }
  }

  // 3 foydalanuvchi tipi
  /// usertype 1 = haydovchi
  /// usertype 2 = yuk jo'natuvchi
  /// usertype 3 = logistik kompaniya

  set userType(String userType) {
    try {
      box.delete("usertype");
      box.put("usertype", userType);
    } catch (e) {
      log(e.toString());
    }
  }

  String get userType {
    try {
      return box.get("usertype");
    } catch (e) {
      log(e.toString());
      return "-1";
    }
  }

// 4 foydalanuvchi token

  set userToken(String token) {
    try {
      box.delete("userToken");
      box.put("userToken", token);
    } catch (e) {
      log(e.toString());
    }
  }

  String get userToken {
    try {
      return box.get("userToken");
    } catch (e) {
      log(e.toString());
      return "-1";
    }
  }

  set userPhone(String token) {
    try {
      box.delete("userPhone");
      box.put("userPhone", token);
    } catch (e) {
      log(e.toString());
    }
  }

  String get userPhone {
    try {
      return box.get("userPhone");
    } catch (e) {
      log(e.toString());
      return "-1";
    }
  }

  set userName(String name) {
    try {
      box.delete("userName");
      box.put("userName", name);
    } catch (e) {
      log(e.toString());
    }
  }

  String get userName {
    try {
      return box.get("userName");
    } catch (e) {
      log(e.toString());
      return "_";
    }
  }

  set userFName(String name) {
    try {
      box.delete("userFName");
      box.put("userFName", name);
    } catch (e) {
      log(e.toString());
    }
  }

  String get userFName {
    try {
      return box.get("userFName");
    } catch (e) {
      log(e.toString());
      return "_";
    }
  }
  set userSName(String name) {
    try {
      box.delete("userSName");
      box.put("userSName", name);
    } catch (e) {
      log(e.toString());
    }
  }

  String get userSName {
    try {
      return box.get("userSName");
    } catch (e) {
      log(e.toString());
      return "_";
    }
  }

  set userBirth(String name) {
    try {
      box.delete("userBirth");
      box.put("userBirth", name);
    } catch (e) {
      log(e.toString());
    }
  }

  String get userBirth {
    try {
      return box.get("userBirth");
    } catch (e) {
      log(e.toString());
      return "_";
    }
  }


  set payType(String name) {
    try {
      box.delete("payType");
      box.put("payType", name);
    } catch (e) {
      log(e.toString());
    }
  }

  String get payType {
    try {
      return box.get("payType");
    } catch (e) {
      log(e.toString());
      return "_";
    }
  }


  set transportType(String name) {
    try {
      box.delete("transportType");
      box.put("transportType", name);
    } catch (e) {
      log(e.toString());
    }
  }

  String get transportType {
    try {
      return box.get("transportType");
    } catch (e) {
      log(e.toString());
      return "_";
    }
  }


  set modelTransport(String name) {
    try {
      box.delete("modelTransport");
      box.put("modelTransport", name);
    } catch (e) {
      log(e.toString());
    }
  }

  String get modelTransport {
    try {
      return box.get("modelTransport");
    } catch (e) {
      log(e.toString());
      return "_";
    }
  }


  set modelManufacturer(String name) {
    try {
      box.delete("modelManufacturer");
      box.put("modelManufacturer", name);
    } catch (e) {
      log(e.toString());
    }
  }

  String get modelManufacturer {
    try {
      return box.get("modelManufacturer");
    } catch (e) {
      log(e.toString());
      return "_";
    }
  }

  set modelCar(String name) {
    try {
      box.delete("modelCar");
      box.put("modelCar", name);
    } catch (e) {
      log(e.toString());
    }
  }

  String get modelCar {
    try {
      return box.get("modelCar");
    } catch (e) {
      log(e.toString());
      return "_";
    }
  }

  set modelCarColor(String name) {
    try {
      box.delete("modelCarColor");
      box.put("modelCarColor", name);
    } catch (e) {
      log(e.toString());
    }
  }

  String get modelCarColor {
    try {
      return box.get("modelCarColor");
    } catch (e) {
      log(e.toString());
      return "_";
    }
  }


  set modelCarYear(String name) {
    try {
      box.delete("modelCarYear");
      box.put("modelCarYear", name);
    } catch (e) {
      log(e.toString());
    }
  }

  String get modelCarYear {
    try {
      return box.get("modelCarYear");
    } catch (e) {
      log(e.toString());
      return "_";
    }
  }


  set modelCarTonsFrom(String name) {
    try {
      box.delete("modelCarTonsFrom");
      box.put("modelCarTonsFrom", name);
    } catch (e) {
      log(e.toString());
    }
  }

  String get modelCarTonsFrom {
    try {
      return box.get("modelCarTonsFrom");
    } catch (e) {
      log(e.toString());
      return "_";
    }
  }

  set modelCarTonsTo(String name) {
    try {
      box.delete("modelCarTonsTo");
      box.put("modelCarTonsTo", name);
    } catch (e) {
      log(e.toString());
    }
  }

  String get modelCarTonsTo {
    try {
      return box.get("modelCarTonsTo");
    } catch (e) {
      log(e.toString());
      return "_";
    }
  }



  set modelCarVolumeFrom(String name) {
    try {
      box.delete("modelCarVolumeFrom");
      box.put("modelCarVolumeFrom", name);
    } catch (e) {
      log(e.toString());
    }
  }

  String get modelCarVolumeFrom {
    try {
      return box.get("modelCarVolumeFrom");
    } catch (e) {
      log(e.toString());
      return "_";
    }
  }


  set modelCarVolumeTo(String name) {
    try {
      box.delete("modelCarVolumeTo");
      box.put("modelCarVolumeTo", name);
    } catch (e) {
      log(e.toString());
    }
  }

  String get modelCarVolumeTo {
    try {
      return box.get("modelCarVolumeTo");
    } catch (e) {
      log(e.toString());
      return "_";
    }
  }

}

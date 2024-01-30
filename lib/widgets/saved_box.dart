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
}

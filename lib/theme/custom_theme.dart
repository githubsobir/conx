import 'package:conx/data/models/theme_type.dart';
import 'package:conx/widgets/saved_box.dart';
import 'package:flutter/material.dart';

final _box = HiveBoxes();

class CustomTheme {
  static Color getPrimaryButtonColor() {
    switch (_box.getTheme()) {
      case ThemeType.light:
        return const Color.fromRGBO(240, 113, 20, 1);
      case ThemeType.dark:
        return const Color.fromRGBO(128, 128, 128, 1);
    }
  }
}

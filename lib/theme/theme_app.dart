import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

final getTheme = StateProvider<bool>((ref) => true);

ThemeData ligthMode = ThemeData(
  brightness: Brightness.light,
  appBarTheme: AppBarTheme(
      color: Colors.blue.shade900,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: const TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      actionsIconTheme: const IconThemeData(color: Colors.white),
      toolbarTextStyle: const TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
      iconTheme: const IconThemeData(color: Colors.white)),
  colorScheme: ColorScheme.light(
      background: Colors.grey.shade100,

      /// qo'shimcha oraliqlar uchun
      primary: Colors.white,

      /// text color, kichkina ikonkalar uchun color
      secondary: Colors.black87,

      /// chat list user text back color
      inversePrimary: Colors.blue.shade900,

      /// chat list audio icon back color
      onPrimary: Colors.grey.shade50,

      /// chat audio back border color
      // onSecondary: Colors.grey.shade200,
      onSecondary: Colors.grey.shade200,

      /// chat user text color
      onSurface: Colors.white,

      /// drawer back color
      onBackground: Colors.blue.shade900),
);

ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
        color: Colors.grey.shade900,
        elevation: 0,
        centerTitle: true,
        actionsIconTheme: const IconThemeData(color: Colors.white)),
    colorScheme: ColorScheme.dark(

        /// orqa fon
        background: Colors.grey.shade900,

        /// qo'shimcha oraliqlar uchun
        primary: Colors.grey.shade800,

        /// text color, kichkina ikonkalar uchun color
        secondary: Colors.white,

        /// chat list user text back color
        inversePrimary: Colors.lightBlue.shade900,

        /// chat list audio icon back color
        onPrimary: Colors.grey.shade500,

        /// chat audio back border color
        onSecondary: Colors.grey.shade600,

        /// chat user text color
        onSurface: Colors.white,

        /// drawer back color
        onBackground: Colors.grey.shade900));

import 'dart:io';
import 'package:connection_notifier/connection_notifier.dart';
import 'package:conx/root_page/root_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';



class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

Future initialization(BuildContext? context) async {
  await Future.delayed(const Duration(milliseconds: 1900));
}


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // await FaceCamera.initialize();
  await ConnectionNotifierTools.initialize();
  await EasyLocalization.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  await Hive.initFlutter();
  await Hive.openBox("online");
  await initialization(null);

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then(
        (_) => runApp(
      EasyLocalization(
        supportedLocales: const [
          Locale('en', 'EN'),
          Locale('qq', 'QQ'),
          Locale('ru', 'RU'),
          Locale('tj', 'TJ'),
          Locale('tr', 'TR'),
          Locale('uz', 'UZ'),
        ],
        path: 'assets/lang',
        fallbackLocale: const Locale('uz', 'UZ'),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
      home:  RootPage(),
    );
  }
}


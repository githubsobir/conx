import 'dart:io';
import 'package:connection_notifier/connection_notifier.dart';
import 'package:conx/firts_part/login_reg/enter_page/lang_model/choose_lang.dart';
import 'package:conx/firts_part/user_fill/user_fill.dart';
import 'package:conx/pages/main/main_page.dart';
import 'package:conx/root_and_unver_page/root_page.dart';
import 'package:conx/scefics/drivers/driver_registration/driver_reg.dart';
import 'package:conx/scefics/drivers/tex_car/tex_car.dart';
import 'package:conx/theme/theme_app.dart';
import 'package:conx/widgets/saved_box.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:riverpod/riverpod.dart';



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
  await ConnectionNotifierTools.initialize();
  await EasyLocalization.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  await Hive.initFlutter();
  await Hive.openBox("sanx");
  await initialization(null);

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then(
        (_) => runApp(
      EasyLocalization(
        supportedLocales: const [
          Locale('en', 'EN'),
          Locale('kk', 'KK'),
          Locale('ru', 'RU'),
          Locale('ta', 'TA'),
          Locale('tr', 'TR'),
          Locale('uz', 'UZ'),
        ],
        path: 'assets/lang',
        fallbackLocale: const Locale('uz', 'UZ'),
        child:  ProviderScope(child: MyApp()),
      ),
    ),
  );
}

class MyApp extends ConsumerWidget {
   MyApp({super.key});

    var box = HiveBoxes();


  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      // darkTheme: darkMode,
      // theme: ligthMode,
      //   themeMode:  ref.watch(getTheme) ? ThemeMode.light : ThemeMode.dark,
      home:
      box.userToken.length > 20?
      RootPage():ChooseLang(),
      // DrawerRegistration():ChooseLang(),
    );
  }
}


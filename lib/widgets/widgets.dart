import 'package:flutter/material.dart';

class MyWidgets{

  static snackBarMyWidgets({required BuildContext context, required String text}){

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));

  }

}
import 'package:conx/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';

Widget user1BirthLoading() {
  return  Center(
    child: CupertinoActivityIndicator(
      color: AppColors.white100,
    ),
  );
}

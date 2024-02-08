import 'package:flutter/cupertino.dart';

Widget userLoading() {
  return Container(
    margin: const EdgeInsets.all(20),
    child: const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [CupertinoActivityIndicator()],
      ),
    ),
  );
}

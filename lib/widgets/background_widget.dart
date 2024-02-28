import 'package:flutter/cupertino.dart';

import '../generated/assets.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Image.asset(
        Assets.imagesRoad,
        fit: BoxFit.fill,
      ),
    );
  }
}

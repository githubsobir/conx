import 'package:conx/pages/active_orders/exporter/controller_exporter.dart';
import 'package:conx/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

getDistrictSheet({required BuildContext context, required String winId}) {
  showModalBottomSheet(
      context: context,
      barrierColor: AppColors.white50,
      builder: (BuildContext context) {
        return Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(14)),
            height: MediaQuery
                .of(context)
                .size
                .height * 0.6,
            child: DistrictSheet(windowId: winId,));
      });
}

class DistrictSheet extends ConsumerStatefulWidget {
  final String windowId;
  const DistrictSheet({super.key, required this.windowId});

  @override
  ConsumerState<DistrictSheet> createState() => _DistrictSheetState();
}

class _DistrictSheetState extends ConsumerState<DistrictSheet> {
  @override
  Widget build(BuildContext context) {
    return
      ref
          .watch(controllerExporter)
          .boolGetData ?
      Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/road2.png"),
                fit: BoxFit.fill)),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: ref
                    .watch(controllerExporter.notifier)
                    .listRegionDistrict
                    .length,
                itemBuilder: (context, index) =>
                    ListTile(
                      onTap: () {
                        ref.read(controllerExporter.notifier).setRegion(
                            districtName:  ref
                                .watch(controllerExporter.notifier)
                                .listRegionDistrict[index].name,
                            districtId:  ref
                                .watch(controllerExporter.notifier)
                                .listRegionDistrict[index].id.toString(),
                            windowId: widget.windowId.toString());
                        Navigator.of(context).pop();
                      },
                      leading: Text(
                        ref
                            .watch(controllerExporter.notifier)
                            .listRegionDistrict[index].name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.white100,
                            fontSize: 16),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios_sharp,
                        color: AppColors.white100,
                      ),
                    ),
              ),
            ),
          ],
        ),
      ) : Center(child: CupertinoActivityIndicator(),);
  }
}

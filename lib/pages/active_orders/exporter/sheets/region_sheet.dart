import 'package:conx/pages/active_orders/exporter/controller_exporter.dart';
import 'package:conx/pages/active_orders/exporter/sheets/dictrict_sheet.dart';
import 'package:conx/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

getBottomSheet({required BuildContext context, required int id}) {
  showModalBottomSheet(
      context: context,
      barrierColor: AppColors.white50,
      builder: (BuildContext context) {
        return Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(14)),
            height: MediaQuery.of(context).size.height * 0.6,
            child: UserBottomSheet(
              idWindow: id,
            ));
      });
}

class UserBottomSheet extends ConsumerStatefulWidget {
  int idWindow;

  UserBottomSheet({super.key, required this.idWindow});

  @override
  ConsumerState<UserBottomSheet> createState() => _UserBottomSheetState();
}

class _UserBottomSheetState extends ConsumerState<UserBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var controllerGetRegion = ref.watch(getCountryList);
    return controllerGetRegion.when(data: (data) {
      return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/road2.png"),
                fit: BoxFit.fill)),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) => ListTile(
                  onTap: () {
                    Navigator.of(context).pop();
                    ref.read(controllerExporter.notifier).getRegion(
                        index: data[index].id.toString(),
                        regionName: data[index].name.toString(),
                        windowId: widget.idWindow);
                    getDistrictSheet(context: context, winId: widget.idWindow.toString());
                  },
                  leading: Text(
                    data[index].name.toString(),
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
      );
    }, error: (error, textError) {
      return Center(
        child: Text(textError.toString()),
      );
    }, loading: () {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    });
  }
}

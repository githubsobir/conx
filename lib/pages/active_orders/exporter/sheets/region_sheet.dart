import 'package:conx/pages/active_orders/exporter/controller_exporter.dart';
import 'package:conx/pages/active_orders/exporter/sheets/dictrict_sheet.dart';
import 'package:conx/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

getBottomSheet({required BuildContext context, required int id, required WidgetRef ref}) {
  ref.read(getCountryList);
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
  final int idWindow;

  const UserBottomSheet({super.key, required this.idWindow});

  @override
  ConsumerState<UserBottomSheet> createState() => _UserBottomSheetState();
}

class _UserBottomSheetState extends ConsumerState<UserBottomSheet> {
  @override
  Widget build(BuildContext context) {



    return  Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/road2.png"),
              fit: BoxFit.fill)),
      child: Column(
        children: [
          Expanded(
            child:
            ref.watch(controllerExporter).boolGetData?
            ListView.builder(
              itemCount: ref.read(controllerExporter.notifier).listCountry.length,
              itemBuilder: (context, index) => ListTile(
                onTap: (){
                  Navigator.of(context).pop();
                  ref.read(controllerExporter.notifier).getRegion(windowId: widget.idWindow,

                      regionName:  ref.read(controllerExporter.notifier).listCountry[index].name.toString(),
                    index:  ref.read(controllerExporter.notifier).listCountry[index].id.toString()
                  );
                  getDistrictSheet(context: context, winId: widget.idWindow.toString());


                },

                leading: Text(
                  ref.read(controllerExporter.notifier).listCountry[index].name.toString(),
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
            )
                :const Center(child: CupertinoActivityIndicator(
              color: AppColors.colorBackground,
            ),)
            ,
          ),
        ],
      ),
    );
  }
}

import 'package:conx/pages/active_orders/exporter/controller_exporter.dart';
import 'package:conx/pages/search/search_details/controller_search.dart';
import 'package:conx/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

setBottomSheetSearch(
    {required BuildContext context, required int id, required WidgetRef ref}) {
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
    return ref.watch(controllerSearchDetails).boolGetData
        ? Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                    image: AssetImage("assets/images/road2.png"),
                    fit: BoxFit.fill)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:10, top: 10 ),
                  child: Text("Hudud ${widget.idWindow}", style: TextStyle(fontSize: 18, color: AppColors.white100, fontWeight: FontWeight.bold),),
                ),
                Expanded(
                  child: ref.watch(controllerExporter).boolGetData
                      ? ListView.builder(
                          itemCount: ref
                              .watch(controllerSearchDetails.notifier)
                              .listCountry
                              .length,
                          itemBuilder: (context, index) => ListTile(
                            onTap: () {
                              Navigator.of(context).pop();
                              // ref.read(controllerSearchDetails.notifier).getRegion(windowId: widget.idWindow,
                              //
                              //     regionName:  ref.read(controllerExporter.notifier).listCountry[index].name.toString(),
                              //     index:  ref.read(controllerExporter.notifier).listCountry[index].id.toString()
                              // );
                              ref.read(controllerSearchDetails.notifier).
                              setRegion(index: widget.idWindow, regName: ref
                                  .watch(controllerSearchDetails.notifier)
                                  .listCountry[index].name.toString(), regionId:  ref
                                  .watch(controllerSearchDetails.notifier)
                                  .listCountry[index].id.toString());
                            },
                            leading: Text(
                              ref
                                  .read(controllerSearchDetails.notifier)
                                  .listCountry[index]
                                  .name
                                  .toString(),
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
                      : const Center(
                          child: CupertinoActivityIndicator(
                            color: AppColors.colorBackground,
                          ),
                        ),
                ),
              ],
            ),
          )
        : const Center(
            child: CupertinoActivityIndicator(),
          );
  }
}

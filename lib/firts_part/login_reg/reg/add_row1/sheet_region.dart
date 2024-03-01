import 'package:conx/firts_part/login_reg/reg/add_row1/controller_row.dart';
import 'package:conx/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

getBottomSheetRegionList({required BuildContext context, required int id}) {
  showModalBottomSheet(
      context: context,
      barrierColor: AppColors.white50,
      builder: (BuildContext context) {
        return Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(14)),
            height: MediaQuery.of(context).size.height * 0.6,
            child: UserBottomSheetRegionList(
              ids: id.toString(),
            ));
      });
}

class UserBottomSheetRegionList extends ConsumerStatefulWidget {
  String ids;

  UserBottomSheetRegionList({super.key, required this.ids});

  @override
  ConsumerState<UserBottomSheetRegionList> createState() =>
      _UserBottomSheetRegionListState();
}

class _UserBottomSheetRegionListState
    extends ConsumerState<UserBottomSheetRegionList> {
  @override
  Widget build(BuildContext context) {
    return buildBody();
  }

  Widget buildBody() {
    if (ref.watch(controllerRowChooseFirstTime).statusData == "1") {
      return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/road2.png"),
                fit: BoxFit.fill)),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: ref
                    .watch(controllerRowChooseFirstTime.notifier)
                    .listModelRegion
                    .length,
                itemBuilder: (context, index) => ListTile(
                  onTap: () {
                    ref.read(controllerRowChooseFirstTime.notifier).setRegion(
                          id: widget.ids,
                          reginName: ref
                              .watch(controllerRowChooseFirstTime.notifier)
                              .listModelRegion[index]
                              .name
                              .toString(),
                          regionId: ref
                              .watch(controllerRowChooseFirstTime.notifier)
                              .listModelRegion[index]
                              .id
                              .toString(),
                        );
                    Navigator.of(context).pop();
                  },
                  leading: Text(
                    ref
                        .watch(controllerRowChooseFirstTime.notifier)
                        .listModelRegion[index]
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
              ),
            ),
          ],
        ),
      );
    } else {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    }
  }
}

import 'package:conx/pages/main/controller_main_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';

class ChooseCity extends ConsumerStatefulWidget {
  const ChooseCity({super.key});

  @override
  ConsumerState<ChooseCity> createState() => _ChooseCityState();
}

class _ChooseCityState extends ConsumerState<ChooseCity> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:
      ref.watch(controllerMainPage).boolGetData?
      Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 15),
              child: Text("region".tr(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20)),
            ),
            Expanded(
                child: ListView.builder(
                  itemCount:
                  ref.watch(controllerMainPage.notifier).listCities.length,
                  itemBuilder: (context, index) => Column(
                    children: [
                      const Divider(),
                      ListTile(
                        onTap: () {

                          Navigator.of(context).pop();
                        },
                        title: Text(ref
                            .watch(controllerMainPage.notifier)
                            .listCities[index]
                            .name
                            .toString()),
                      ),
                    ],
                  ),
                ))
          ]):Center(child: CupertinoActivityIndicator()),
    );
  }
}

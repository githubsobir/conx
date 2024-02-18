import 'package:cached_network_image/cached_network_image.dart';
import 'package:conx/scefics/drivers/choose_rate/choose_rate.dart';
import 'package:conx/scefics/drivers/driver_registration/driver_choose_company/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DriverChooseCompany extends ConsumerStatefulWidget {
  const DriverChooseCompany({super.key});

  @override
  ConsumerState<DriverChooseCompany> createState() =>
      _DriverChooseCompanyState();
}

class _DriverChooseCompanyState extends ConsumerState<DriverChooseCompany> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:
      ref.watch(controllerDriverChooseLogComp).boolGetData?
      SafeArea(
        child: Container(
          margin: const EdgeInsets.only(right: 20, left: 20),
          child: Column(
            children: [
              const Text(
                "Выбирите свою компанию",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade200),
              ),
              const SizedBox(height: 20),
              Expanded(
                  child: ListView.builder(
                      itemCount: ref
                          .watch(controllerDriverChooseLogComp.notifier)
                          .listCompany
                          .length+1,
                      itemBuilder: (context, index) => index == 0
                          ? Card(
                              color: Colors.grey.shade200,
                              child: ListTile(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                title: Text("Не указать"),
                                trailing: Icon(Icons.arrow_forward_ios),
                              ))
                          : Card(
                              color: Colors.grey.shade100,
                              child: ListTile(
                                onTap: () {



                                  Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                        builder: (context) => ChooseRate(),
                                      ));
                                },
                                leading: CachedNetworkImage(
                                    imageUrl:
                                    ref
                                    .watch(
                                        controllerDriverChooseLogComp.notifier)
                                    .listCompany[index-1]
                                    .avatar
                                    .toString(),
                                fit: BoxFit.cover,
                                  width: 60,
                                  height: 60,
                                ),
                                title: Text(ref
                                    .watch(
                                    controllerDriverChooseLogComp.notifier)
                                    .listCompany[index-1]
                                    .companyName),
                                subtitle: Text("Logistics service in Tashkent"),
                                trailing: Icon(Icons.arrow_forward_ios),
                              ))))
            ],
          ),
        ),
      ):Center(child: CupertinoActivityIndicator()),
    );
  }
}

import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:conx/pages/main/models/model_main.dart';
import 'package:conx/root_and_unver_page/unversal_pages/confirmation_page/confirmation_page.dart';
import 'package:conx/root_and_unver_page/unversal_pages/details_page/model_detail/model_details.dart';
import 'package:conx/theme/app_colors.dart';
import 'package:conx/widgets/background_widget.dart';
import 'package:conx/widgets/chart_pie.dart';
import 'package:conx/widgets/loading_indicator.dart';
import 'package:conx/widgets/primary_button.dart';
import 'package:easy_pie_chart/easy_pie_chart.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  final ModelOrderList modelOrderList;
  final List<String> list;

  const DetailPage(
      {super.key, required this.modelOrderList, required this.list});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  _DetailPageState();

  late List<ModelDetailsPage> listDetails;

  int indexImage = 0;

  final List<PieData> pies = [
    PieData(value: 0.24, color: Colors.cyan),
    PieData(value: 0.75, color: Colors.yellow),
  ];

  bool visibleUserCont = false;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    scrollController = ScrollController(initialScrollOffset: 5.0)
      ..addListener(scrollListener);
    // animateToLast();
    funcSetData();
    super.initState();
  }

  scrollListener() async {
    if (scrollController.offset <= scrollController.position.maxScrollExtent &&
        scrollController.position.outOfRange) {
      // scrollController.addListener(() {});
    }
  }

  @override
  void dispose() {
    scrollController.dispose();

    super.dispose();
  }

  animateToLast() async {
    await Future.delayed(const Duration(milliseconds: 500)).then((_) {
      try {
        scrollController
            .animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 350),
          curve: Curves.fastOutSlowIn,
        )
            .then((value) {
          scrollController.animateTo(
            scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 100),
            curve: Curves.easeInOut,
          );
        });
      } catch (e) {
        // print('error on scroll $e');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundWidget(),
          ListView(
            // mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 330,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: GestureDetector(
                        onHorizontalDragEnd: (DragEndDetails drag) {
                          if (drag.primaryVelocity == null) return;
                          if (drag.primaryVelocity! < 0) {
                            // drag from right to left
                            if (indexImage >= widget.list.length - 1) {
                              indexImage = 0;
                            } else {
                              indexImage = indexImage + 1;
                            }
                            // setState(() {});
                          } else {
                            // drag from left to right
                            if (indexImage <= 0) {
                              indexImage = widget.list.length - 1;
                            } else {
                              indexImage = indexImage - 1;
                            }

                            // setState(() {});
                          }
                        },
                        child:
                        widget.list.isNotEmpty?
                        CachedNetworkImage(
                          width: MediaQuery.of(context).size.width,
                          height: 320,
                          fit: BoxFit.cover,
                          imageUrl: widget.list[indexImage],
                          alignment: Alignment.topCenter,
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) =>
                                  loadingIndicator(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ):SizedBox.shrink(),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 10, bottom: 10),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              color: AppColors.background,
                              shape: BoxShape.circle),
                          child: Icon(
                            Icons.local_shipping_outlined,
                            color: AppColors.white100,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(30, 40, 30, 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Icon(
                              Platform.isIOS
                                  ? Icons.arrow_back_ios
                                  : Icons.arrow_back,
                              color: AppColors.white100,
                              size: 38,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 12,
                width: 200,
                margin: const EdgeInsets.fromLTRB(5, 0, 5, 5),
                child: Center(
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.list.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              indexImage = index;
                              // setState(() {});
                            },
                            child: Container(
                              height: index == indexImage ? 5 : 2,
                              width: index == indexImage ? 20 : 10,
                              margin: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                  color: index == indexImage
                                      ? AppColors.newOrangeColorForIcon
                                      : AppColors.newOrangeColorForIcon,
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                          )),
                ),
              ),
              Container(
                  padding: const EdgeInsets.only(right: 10, left: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.favorite_border,
                                  color: AppColors.white100,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  "Нравится ${widget.modelOrderList.views}",
                                  style: TextStyle(
                                      color: AppColors.white100,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Icon(
                              Icons.turned_in_not_sharp,
                              size: 30,
                              color: AppColors.white100,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(
                              "Produkt",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.white100,
                                  fontSize: 24),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.newOrangeColorForIcon,
                            ),
                            child: Text("Думает о предложении"),
                          )
                        ],
                      ),
                    ],
                  )),
              Container(
                  height: MediaQuery.of(context).size.height * 1.6,
                  margin: const EdgeInsets.all(10),
                  child: Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 20, right: 20),
                        padding: const EdgeInsets.all(10),
                        alignment: Alignment.topRight,
                        child: AppChartPie(
                            pies: pies,
                            text1: "Производител",
                            text2: "Производител"),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 1.5,
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: listDetails.length,
                          itemBuilder: (context, index) => index !=
                                  listDetails.length - 1
                              ? Container(
                                  margin: const EdgeInsets.all(4),
                                  padding: const EdgeInsets.all(8),
                                  child: ListTile(
                                      minVerticalPadding: 0,
                                      dense: true,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 0.0, vertical: 0.0),
                                      visualDensity: const VisualDensity(
                                          horizontal: -2, vertical: -4),
                                      leading: listDetails[index].icon,
                                      title: Text(
                                        listDetails[index].name,
                                        style: TextStyle(
                                            color: AppColors.white100,
                                            fontSize: 16,
                                            fontFamily: "Inter",
                                            fontWeight: FontWeight.w600),
                                      ),
                                      subtitle: Text(
                                        listDetails[index].name2,
                                        style: TextStyle(
                                            color: AppColors.white100,
                                            fontSize: 12,
                                            fontFamily: "Inter",
                                            fontWeight: FontWeight.w500),
                                      ),
                                      trailing: listDetails[index].id == "9"
                                          ? IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                Icons.translate,
                                                color: AppColors.white100,
                                              ))
                                          : const SizedBox.shrink()),
                                )
                              : Container(
                                  margin: const EdgeInsets.all(10),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          MaterialButton(
                                              onPressed: () {},
                                              shape: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              color: AppColors.red,
                                              textColor: AppColors.white100,
                                              child: const Text("Na reyse")),
                                          const SizedBox(width: 10),
                                          MaterialButton(
                                            onPressed: () {},
                                            color: AppColors.green2,
                                            shape: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            textColor: AppColors.white100,
                                            child: Text("Obratniy"),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          MaterialButton(
                                            onPressed: () {},
                                            height: 60,
                                            minWidth: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.4,
                                            shape: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            color: AppColors.white100,
                                            child: const Column(
                                              children: [
                                                Icon(Icons.phone),
                                                Text("Zvanok")
                                              ],
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          MaterialButton(
                                            onPressed: () {},
                                            color: AppColors.white100,
                                            height: 60,
                                            minWidth: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.4,
                                            shape: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: const Column(
                                              children: [
                                                Icon(
                                                    Icons.chat_bubble_outlined),
                                                Text("Chat")
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 15),
                                      PrimaryButton2(
                                          text: "Оформит Зоказ",
                                          onPressed: () {
                                            showDialogs();
                                          })
                                    ],
                                  ),
                                ),
                        ),
                      )
                    ],
                  )),
            ],
          ),
        ],
      ),
    );
  }

  showDialogs() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            insetPadding: EdgeInsets.zero,
            contentPadding: EdgeInsets.zero,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            content: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.9,
              child: ConfirmationPage(
                modelOrderList: widget.modelOrderList,
              ),
            ),
          );
        });
  }

  funcSetData() {
    listDetails = [
      ModelDetailsPage(
        id: "0",
        name: "Сагдуллаев Сардорбек",
        name2: "Владелец",
        icon: Icon(
          Icons.person_outline,
          color: AppColors.newOrangeColorForIcon,
        ),
      ),
      ModelDetailsPage(
        id: "1",
        name: widget.modelOrderList.price.toString(),
        name2: "Цена",
        icon: Icon(
          Icons.attach_money,
          color: AppColors.newOrangeColorForIcon,
        ),
      ),
      ModelDetailsPage(
        id: "2",
        name:
            "${widget.modelOrderList.locationFrom.name} - ${widget.modelOrderList.locationTo.name}",
        name2: "направление",
        icon: Icon(Icons.location_on_outlined,
            color: AppColors.newOrangeColorForIcon),
      ),
      ModelDetailsPage(
        id: "3",
        name: widget.modelOrderList.transportType.toString(),
        name2: "Запрошенный транспорт",
        icon: Icon(Icons.local_shipping_outlined,
            color: AppColors.newOrangeColorForIcon),
      ),
      ModelDetailsPage(
        id: "4",
        name: widget.modelOrderList.date.toString(),
        name2: "Срок прибытия в пункт назначения ",
        icon: Icon(Icons.calendar_month_outlined,
            color: AppColors.newOrangeColorForIcon),
      ),
      ModelDetailsPage(
        id: "5",
        name: widget.modelOrderList.typePayment.toString(),
        name2: "Тип оплаты",
        icon: Icon(Icons.account_balance_wallet_outlined,
            color: AppColors.newOrangeColorForIcon),
      ),
      // ModelDetailsPage(
      //   id: "1",
      //   name: "Документы",
      //   name2: "Документы",
      //   icon: Icon(Icons.book_outlined, color: AppColors.newOrangeColorForIcon),
      // ),
      ModelDetailsPage(
        id: "6",
        name: widget.modelOrderList.locationFrom.name.toString(),
        name2: "Страна",
        icon: Icon(Icons.language, color: AppColors.newOrangeColorForIcon),
      ),
      ModelDetailsPage(
        id: "7",
        name: widget.modelOrderList.transportType.toString(),
        name2: "Гос Номер  автомобиль и прицеп  ",
        icon:
            Icon(Icons.account_balance, color: AppColors.newOrangeColorForIcon),
      ),
      ModelDetailsPage(
        id: "8",
        name: "${widget.modelOrderList.weight} тонн",
        name2: "Вес транспорта. ",
        icon: Icon(Icons.local_atm, color: AppColors.newOrangeColorForIcon),
      ),
      ModelDetailsPage(
        id: "9",
        name: widget.modelOrderList.description.toString(),
        name2: "Комментарий",
        icon:
            Icon(Icons.insert_comment, color: AppColors.newOrangeColorForIcon),
      ),
      ModelDetailsPage(
        id: "10",
        name: "",
        name2: "",
        icon: Icon(Icons.local_atm, color: AppColors.newOrangeColorForIcon),
      ),
    ];
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }
}

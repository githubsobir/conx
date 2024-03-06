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
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  final ModelOrderList modelOrderList;
  final List<String> list;

  const DetailPage(
      {super.key, required this.modelOrderList, required this.list});

  @override
  State<DetailPage> createState() => _DetaelPageState();
}

class _DetaelPageState extends State<DetailPage> {
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
                  child: CachedNetworkImage(
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
                  ),
                ),
              ),
              Container(
                padding:
                const EdgeInsets.only(right: 10, bottom: 10),

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
                                  "Нравится 1252",
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
                height: MediaQuery.of(context).size.height*1.4,
                margin: const EdgeInsets.all(10),
                child: ListView.builder(
                  physics:const NeverScrollableScrollPhysics(),

                  itemCount: listDetails.length,
                  itemBuilder: (context, index) => index !=
                      listDetails.length - 1
                      ? Container(
                    margin: const EdgeInsets.all(4),
                    padding: const EdgeInsets.all(8),
                    child: Row(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          listDetails[index].icon,
                          const SizedBox(width: 8),
                          SizedBox(
                            width: MediaQuery.of(context)
                                .size
                                .width *
                                0.75,
                            child: Column(
                              mainAxisAlignment:
                              MainAxisAlignment.start,
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text(
                                  listDetails[index].name,
                                  style: TextStyle(
                                      color: AppColors.white100,
                                      fontSize: 16,
                                      fontFamily: "Inter",
                                      fontWeight:
                                      FontWeight.w600),
                                ),
                                Text(
                                  listDetails[index].name2,
                                  style: TextStyle(
                                      color: AppColors.white100,
                                      fontSize: 12,
                                      fontFamily: "Inter",
                                      fontWeight:
                                      FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ]),
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
                                child: Text("Na reyse")),
                            const SizedBox(width: 10),
                            MaterialButton(
                              onPressed: () {},
                              color: AppColors.green2,
                              shape: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(
                                      20)),
                              textColor: AppColors.white100,
                              child: Text("Obratniy"),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            MaterialButton(
                              onPressed: () {},
                              height: 60,
                              shape: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(
                                      10)),
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
                              shape: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(
                                      10)),
                              child: const Column(
                                children: [
                                  Icon(Icons
                                      .chat_bubble_outlined),
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
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, right: 20),
                padding: const EdgeInsets.all(10),
                alignment: Alignment.topRight,
                child: AppChartPie(
                    pies: pies,
                    text1: "Производител",
                    text2: "Производител"),
              ),

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
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            child: const ConfirmationPage(),
          );
        });
  }

  List<ModelDetailsPage> listDetails = [
    ModelDetailsPage(
      id: "1",
      name: "Сагдуллаев Сардорбек",
      name2: "Владелец",
      icon: Icon(
        Icons.person_outline,
        color: AppColors.newOrangeColorForIcon,
      ),
    ),
    ModelDetailsPage(
      id: "1",
      name: "7800",
      name2: "Цена",
      icon: Icon(
        Icons.attach_money,
        color: AppColors.newOrangeColorForIcon,
      ),
    ),
    ModelDetailsPage(
      id: "1",
      name: "Ташкент-Москва",
      name2: "направление",
      icon: Icon(Icons.location_on_outlined,
          color: AppColors.newOrangeColorForIcon),
    ),
    ModelDetailsPage(
      id: "1",
      name: "Рефрижераторный  +5",
      name2: "Запрошенный транспорт",
      icon: Icon(Icons.local_shipping_outlined,
          color: AppColors.newOrangeColorForIcon),
    ),
    ModelDetailsPage(
      id: "1",
      name: "12.03.24-16.03.24",
      name2: "Срок прибытия в пункт назначения ",
      icon: Icon(Icons.calendar_month_outlined,
          color: AppColors.newOrangeColorForIcon),
    ),
    ModelDetailsPage(
      id: "1",
      name: "Наличные, картой, перечисление",
      name2: "Тип оплаты",
      icon: Icon(Icons.account_balance_wallet_outlined,
          color: AppColors.newOrangeColorForIcon),
    ),
    ModelDetailsPage(
      id: "1",
      name: "Документы",
      name2: "Документы",
      icon: Icon(Icons.book_outlined, color: AppColors.newOrangeColorForIcon),
    ),
    ModelDetailsPage(
      id: "1",
      name: "Узбекистан",
      name2: "Страна",
      icon: Icon(Icons.language, color: AppColors.newOrangeColorForIcon),
    ),
    ModelDetailsPage(
      id: "1",
      name: "01 F 132 YA автомобиль \n01 F 132 YA прицеп",
      name2: "Гос Номер  автомобиль и прицеп  ",
      icon: Icon(Icons.account_balance, color: AppColors.newOrangeColorForIcon),
    ),
    ModelDetailsPage(
      id: "1",
      name: "17500 кг по тех паспорте",
      name2: "Вес транспорта",
      icon: Icon(Icons.local_atm, color: AppColors.newOrangeColorForIcon),
    ),
    ModelDetailsPage(
      id: "1",
      name: "Мне нужно отправить яблоки из Ташкента в Москву до 16 января.",
      name2: "Комментарий",
      icon: Icon(Icons.insert_comment, color: AppColors.newOrangeColorForIcon),
    ),
    ModelDetailsPage(
      id: "1",
      name: "",
      name2: "",
      icon: Icon(Icons.local_atm, color: AppColors.newOrangeColorForIcon),
    ),
  ];

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }
}

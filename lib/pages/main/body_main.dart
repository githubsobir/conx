import 'package:cached_network_image/cached_network_image.dart';
import 'package:conx/generated/assets.dart';
import 'package:conx/pages/main/controller_main_page.dart';
import 'package:conx/root_and_unver_page/unversal_pages/detail_page.dart';
import 'package:conx/theme/app_colors.dart';
import 'package:conx/widgets/chart_pie.dart';
import 'package:conx/widgets/loading_indicator.dart';
import 'package:easy_pie_chart/easy_pie_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BodyMain extends ConsumerStatefulWidget {
  int index;

  BodyMain({super.key, required this.index});

  @override
  ConsumerState<BodyMain> createState() => _BodyMainState();
}

class _BodyMainState extends ConsumerState<BodyMain> {
  int indexImage = 0;
  final List<PieData> pies = [
    PieData(value: 0.24, color: Colors.cyan),
    PieData(value: 0.75, color: Colors.yellow),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(1),
        margin: const EdgeInsets.fromLTRB(15, 5, 15, 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.white10, width: 1)),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              child: GestureDetector(
                onHorizontalDragEnd: (DragEndDetails drag) {
                  if (drag.primaryVelocity == null) return;
                  if (drag.primaryVelocity! < 0) {
                    // drag from right to left
                    if (indexImage >=
                        ref
                                .watch(controllerMainPage.notifier)
                                .listImages
                                .length -
                            1) {
                      indexImage = 0;
                    } else {
                      indexImage = indexImage + 1;
                    }
                    setState(() {});
                  } else {
                    // drag from left to right
                    if (indexImage <= 0) {
                      indexImage = ref
                              .watch(controllerMainPage.notifier)
                              .listImages
                              .length -
                          1;
                    } else {
                      indexImage = indexImage - 1;
                    }

                    setState(() {});
                  }
                },
                child: Stack(
                  children: [
                    CachedNetworkImage(
                      width: MediaQuery.of(context).size.width,
                      height: 320,
                      fit: BoxFit.cover,
                      imageUrl: ref
                          .watch(controllerMainPage.notifier)
                          .listImages[indexImage]
                          .image[0]
                          .toString(),
                      alignment: Alignment.topCenter,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) =>
                              loadingIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 10, bottom: 10),
                      height: 320,
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
                  ],
                ),
              ),
            ),
            Container(
              height: 12,
              margin: const EdgeInsets.fromLTRB(5, 0, 5, 5),
              child: Center(
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: ref
                        .watch(controllerMainPage.notifier)
                        .listImages
                        .length,
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
                    const SizedBox(height: 3),
                    Column(
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
                                    "Нравится ---",
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(mainAxisSize: MainAxisSize.min, children: [
                                  Icon(
                                    Icons.local_atm,
                                    color: AppColors.newOrangeColorForIcon,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    ref
                                        .watch(controllerMainPage.notifier)
                                        .listMainPage[widget.index]
                                        .price
                                        .toString(),
                                    style: TextStyle(
                                        color: AppColors.white100,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ]),
                                const SizedBox(height: 8),
                                Row(mainAxisSize: MainAxisSize.min, children: [
                                  SvgPicture.asset(
                                    Assets.iconsIcRouting,
                                    color: AppColors.newOrangeColorForIcon,
                                    fit: BoxFit.cover,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    "${ref.watch(controllerMainPage.notifier).listMainPage[widget.index].locationFrom.name}-${ref.watch(controllerMainPage.notifier).listMainPage[widget.index].locationTo.name}",
                                    style: TextStyle(
                                        color: AppColors.white100,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ]),
                                const SizedBox(height: 10),
                                Row(mainAxisSize: MainAxisSize.min, children: [
                                  Icon(
                                    Icons.local_shipping_outlined,
                                    size: 16,
                                    color: AppColors.newOrangeColorForIcon,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    "Transport ${ref.watch(controllerMainPage.notifier).listMainPage[widget.index].transportType}",
                                    style: TextStyle(
                                        color: AppColors.white100,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ]),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(height: 20),
                                AppChartPie(
                                    pies: pies,
                                    text1: "Производител",
                                    text2: "Производител"),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                )),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Показать перевод",
                    style: TextStyle(
                        color: AppColors.white100,
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "Час назад",
                    style: TextStyle(
                        color: AppColors.white100,
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
            const SizedBox(height: 7),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => DetailPage(
                              modelOrderList: ref
                                  .watch(controllerMainPage.notifier)
                                  .listMainPage[widget.index],
                              list: ref
                                  .watch(controllerMainPage.notifier)
                                  .listImages[indexImage]
                                  .image),
                        ));
                  },
                  child: Text(
                    "To'liq ma'lumot",
                    style: TextStyle(
                        color: AppColors.white100,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
          ],
        ));
  }
}

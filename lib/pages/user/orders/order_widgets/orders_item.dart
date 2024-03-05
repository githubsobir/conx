import 'package:cached_network_image/cached_network_image.dart';
import 'package:conx/generated/assets.dart';
import 'package:conx/pages/user/orders/order_widgets/bottomsheets_order.dart';
import 'package:conx/theme/app_colors.dart';
import 'package:conx/widgets/background_widget.dart';
import 'package:conx/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrdersItem extends ConsumerStatefulWidget {
  const OrdersItem({super.key});

  @override
  ConsumerState<OrdersItem> createState() => _OrdersItemState();
}

class _OrdersItemState extends ConsumerState<OrdersItem> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundWidget(),
          SafeArea(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) => Container(
                height: 235,
                width: double.infinity,
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                      image: AssetImage(Assets.imagesRoad), fit: BoxFit.cover),
                ),
                child: Column(
                  children: [
                    Row(children: [
                      CachedNetworkImage(
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: 130,
                        fit: BoxFit.cover,
                        imageUrl:
                            "https://www.railcontinent.ru/upload/articles/pogruzka.jpg",
                        alignment: Alignment.topCenter,

                        progressIndicatorBuilder:
                            (context, url, downloadProgress) =>
                                loadingIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Сагдуллаев Сардорбек",
                            style: TextStyle(
                                color: AppColors.white100,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                         const SizedBox(height: 10),
                          Row(mainAxisSize: MainAxisSize.min, children: [
                            Icon(
                              Icons.attach_money,
                              color: AppColors.white100,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              "5900",
                              style: TextStyle(
                                  color: AppColors.white100,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ]),
                          const SizedBox(height: 8),
                          Row(mainAxisSize: MainAxisSize.min, children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: AppColors.white100,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              "ref",
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
                              size: 20,
                              color: AppColors.white100,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              "Transport ",
                              style: TextStyle(
                                  color: AppColors.white100,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ]),
                          const SizedBox(height: 10),
                          Row(mainAxisSize: MainAxisSize.min, children: [
                            Icon(
                              Icons.calendar_month_outlined,
                              size: 20,
                              color: AppColors.white100,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              "12-12-23-20-02-24 ",
                              style: TextStyle(
                                  color: AppColors.white100,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ]),
                        ],
                      ),
                    ]),
                    Row(children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.all(4),
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 10, left: 10),
                          decoration: BoxDecoration(
                              color: AppColors.blue2,
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(mainAxisSize: MainAxisSize.min, children: [
                            Icon(
                              Icons.map_outlined,
                              size: 20,
                              color: AppColors.white100,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              "Open map ",
                              style: TextStyle(
                                  color: AppColors.white100,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ]),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: (){
                            getOrderBottomSheet(context: context, id: 1, ref: ref);
                          },
                          child: Container(
                            margin: EdgeInsets.all(4),
                            padding:
                              const   EdgeInsets.only(top: 10, bottom: 10, left: 10),
                            decoration: BoxDecoration(
                                color: AppColors.blue2,
                                borderRadius: BorderRadius.circular(5)),
                            child: Row(mainAxisSize: MainAxisSize.min, children: [
                              Icon(
                                Icons.map_outlined,
                                size: 20,
                                color: AppColors.white100,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                "Click ",
                                style: TextStyle(
                                    color: AppColors.white100,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ]),
                          ),
                        ),
                      )
                    ]),
                    const Spacer(),
                    Text("Batafsil",
                        style: TextStyle(
                            color: AppColors.white100,
                            fontWeight: FontWeight.bold))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

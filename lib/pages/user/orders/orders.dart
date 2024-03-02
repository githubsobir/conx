import 'package:conx/generated/assets.dart';
import 'package:conx/pages/user/orders/order_widgets/orders_item.dart';
import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';
import '../../../widgets/background_widget.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {

  int indexSelected = 0;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        const BackgroundWidget(),
        SafeArea(
            child: Column(children: [
          AppBar(
            backgroundColor: AppColors.transparent,
            iconTheme: IconThemeData(color: AppColors.white100),
            title: Text("Buyrutmalar",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: AppColors.white100)),
            centerTitle: true,
          ),
          SizedBox(
            height: 56,
            child: ListView.builder(
              itemCount: list.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(

                  onTap: (){
                    indexSelected = index;
                    pageController.jumpToPage(index);
                    setState(() {

                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.all(4),
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 10, bottom: 10),
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(Assets.imagesRoad3),
                            fit: BoxFit.fill)),
                    child: Text(
                      list[index],
                      style: TextStyle(color:
                      indexSelected == index ?AppColors.newOrangeColorForIcon:
                      AppColors.white100, fontSize: 18),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
              child: PageView.builder(
                pageSnapping: false,
                physics: NeverScrollableScrollPhysics(),
                controller: pageController,//PageController(initialPage: indexSelected, keepPage: true, viewportFraction: 1),
            itemCount: list.length,
            itemBuilder: (context, index) {
              return
                index == 0?
                const OrdersItem():
                Container(
                  height: 300,
                  width: 200,
                  color: AppColors.blue2,
                );
            },
          ))
        ])),
      ]),
    );
  }

  List<String> list = ["Все", "ожидание", "принял", "в действе"];
}

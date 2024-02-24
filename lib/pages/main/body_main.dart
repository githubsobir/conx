import 'package:cached_network_image/cached_network_image.dart';
import 'package:conx/root_and_unver_page/unversal_pages/detail_page.dart';
import 'package:conx/theme/app_colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:loading_indicator/loading_indicator.dart';

class BodyMain extends StatefulWidget {
  const BodyMain({super.key});

  @override
  State<BodyMain> createState() => _BodyMainState();
}

class _BodyMainState extends State<BodyMain> {
  final List<String> imageUrls = [
    'https://fruitgrowersnews.com/wp-content/uploads/2018/07/California-strawberries.jpg',
    "https://avatars.mds.yandex.net/i?id=eaa9ce5c3caa2776986b9acba8e1e3922431db63-9293412-images-thumbs&n=13",
    'https://avatars.mds.yandex.net/i?id=0c901e94b959453fd5ee0ed4b4d5bb42-5225319-images-thumbs&n=13',
    'https://img.promportal.su/foto/good_fotos/2527/25274616/prodam-molodoy-kartofel-optom-v-krasnodarskom-krae_foto_largest.jpg',
    "https://agromer-storage-public.storage.yandexcloud.net/st/images/2469/offers/69e711ff-5d18-4865-800b-b6a0466d5f9c/748de53fa5c6f7850c5dc1ff67122b3c.jpg"
  ]; // List of image URLs

  int indexImage = 0;
  List<PieChartSectionData>? sections = [
    PieChartSectionData(
      color: Colors.orange,
      value: 0.3,
      title: "",
      radius: 12,
    ),
    PieChartSectionData(
      color: Colors.green,
      value: 0.3,
      title: "",
      radius: 12,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Center(
          child: Container(
        padding: const EdgeInsets.all(2),
        margin: const EdgeInsets.fromLTRB(15, 5, 15, 4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: const DecorationImage(
                image: AssetImage("assets/images/road.jpeg"),
                fit: BoxFit.cover)),
        child: Column(
          children: [
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: GestureDetector(
                    onHorizontalDragEnd: (DragEndDetails drag) {
                      if (drag.primaryVelocity == null) return;
                      if (drag.primaryVelocity! < 0) {
                        // drag from right to left
                        if (indexImage >= imageUrls.length - 1) {
                          indexImage = 0;
                        } else {
                          indexImage = indexImage + 1;
                        }
                        setState(() {});
                      } else {
                        // drag from left to right
                        if (indexImage <= 0) {
                          indexImage = imageUrls.length - 1;
                        } else {
                          indexImage = indexImage - 1;
                        }

                        setState(() {});
                      }
                    },
                    child: CachedNetworkImage(
                      width: MediaQuery.of(context).size.width,
                      height: 250,
                      fit: BoxFit.cover,
                      imageUrl: imageUrls[indexImage],
                      alignment: Alignment.topCenter,
                      progressIndicatorBuilder: (context, url,
                              downloadProgress) =>
                          // CircularProgressIndicator(value: downloadProgress.progress),
                          const LoadingIndicator(
                              indicatorType: Indicator.ballPulse,

                              /// Required, The loading type of the widget
                              colors: [
                                Colors.red,
                                Colors.orange,
                                Colors.yellow,
                                Colors.green,
                                Colors.blue,
                                Colors.indigo,
                                Colors.purple,
                              ],

                              /// Optional, The color collections
                              strokeWidth: 1,

                              /// Optional, The stroke of the line, only applicable to widget which contains line
                              backgroundColor: Colors.white,

                              /// Optional, Background of the widget

                              pathBackgroundColor: Colors.black

                              /// Optional, the stroke backgroundColor
                              ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
                SizedBox(
                  width: 120,
                  height: 8,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: imageUrls.length,
                    itemBuilder: (context, index) => Container(
                      margin: const EdgeInsets.all(1),
                      padding: const EdgeInsets.all(10),
                      color: Colors.orange,
                      height: 1,
                      width: 10,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                 Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.favorite_border,
                                color: AppColors.white100,
                              ),
                              const SizedBox(width: 20),
                              Icon(
                                Icons.send,
                                color: AppColors.white100,
                              ),
                            ],
                          ),
                          const SizedBox(height: 2),
                          Text(
                            "Нравится 1252",
                            style: TextStyle(
                                color: AppColors.white100,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            "\$ 6 000",
                            style: TextStyle(
                                color: AppColors.white100,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          const SizedBox(height: 2),
                          Row(mainAxisSize: MainAxisSize.min, children: [
                            Icon(
                              Icons.screen_rotation_alt,
                              size: 16,
                              color: AppColors.white100,
                            ),
                            const SizedBox(width: 2),
                            Text(
                              "Moskva-Toshkent",
                              style: TextStyle(color: AppColors.white100),
                            ),
                          ]),
                          SizedBox(height: 1),
                          Row(mainAxisSize: MainAxisSize.min, children: [
                            Icon(
                              Icons.car_crash_sharp,
                              size: 16,
                              color: AppColors.white100,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              "Transport",
                              style: TextStyle(color: AppColors.white100),
                            ),
                          ]),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.turned_in_not_sharp,
                                  size: 30,
                                  color: AppColors.white100,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 50),
                          Stack(
                            children: [
                              SizedBox(height: 40,
                                width: 120,
                                child: PieChart(PieChartData(

                                  pieTouchData: PieTouchData(

                                    touchCallback:
                                        (FlTouchEvent event, pieTouchResponse) {
                                      setState(() {
                                        if (!event
                                                .isInterestedForInteractions ||
                                            pieTouchResponse == null ||
                                            pieTouchResponse.touchedSection ==
                                                null) {
                                          return;
                                        }
                                      });
                                    },
                                  ),
                                  borderData: FlBorderData(
                                    border: Border.all(
                                        color: Colors.black,
                                        width: 1,
                                        strokeAlign: 2),
                                    show: true,
                                  ),
                                  sectionsSpace: 0,
                                  centerSpaceRadius: 40,
                                  sections: sections,
                                )),
                              ),
                              Align(
                                  alignment: Alignment.center,
                                  heightFactor: 0.32,
                                  widthFactor: 1.9,
                                  child: Column(
                                    children: [
                                      Align(
                                        child: Text(
                                          "50",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.white100),
                                        ),
                                        alignment: Alignment.topCenter,
                                      ),
                                      SizedBox(height: 15),
                                      Text(
                                        "50 %",
                                        style: TextStyle(
                                            color: AppColors.white100,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Производител",
                                        style: TextStyle(
                                            color: AppColors.white100,
                                            fontSize: 9,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Container(
                                        height: 1,
                                        width: 65,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        "Производител",
                                        style: TextStyle(
                                          color: Colors.orange,
                                          fontSize: 9,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "50 %",
                                        style: TextStyle(
                                            color: Colors.orange,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 20),
                                      Align(
                                        child: Text(
                                          "50",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                        alignment: Alignment.bottomCenter,
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Час назад",
                        style: TextStyle(
                            color: AppColors.white100,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => DetailPage(),
                          ));
                    },
                    minWidth: double.infinity,
                    height: 30,
                    shape: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(10)),
                    child: Text("To'liq ma'lumot",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}

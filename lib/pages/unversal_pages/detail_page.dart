import 'package:cached_network_image/cached_network_image.dart';
import 'package:conx/pages/unversal_pages/choose_plan.dart';
import 'package:conx/widgets/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetaelPageState();
}

class _DetaelPageState extends State<DetailPage> {
  int indexImage = 0;

  final List<String> imageUrls = [
    'https://fruitgrowersnews.com/wp-content/uploads/2018/07/California-strawberries.jpg',
    "https://avatars.mds.yandex.net/i?id=eaa9ce5c3caa2776986b9acba8e1e3922431db63-9293412-images-thumbs&n=13",
    'https://avatars.mds.yandex.net/i?id=0c901e94b959453fd5ee0ed4b4d5bb42-5225319-images-thumbs&n=13',
    'https://img.promportal.su/foto/good_fotos/2527/25274616/prodam-molodoy-kartofel-optom-v-krasnodarskom-krae_foto_largest.jpg',
    "https://agromer-storage-public.storage.yandexcloud.net/st/images/2469/offers/69e711ff-5d18-4865-800b-b6a0466d5f9c/748de53fa5c6f7850c5dc1ff67122b3c.jpg"
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
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
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
                      height: 330,
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
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
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
                        child: const Icon(
                          CupertinoIcons.arrow_left_square,
                          color: Colors.white,
                          size: 38,
                        ),
                      ),
                      const Text("Buyrutma berish uchun",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: const Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              height: 12,
              margin: const EdgeInsets.fromLTRB(5, 10, 5, 5),
              child: Center(
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: imageUrls.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            indexImage = index;
                            setState(() {});
                          },
                          child: Container(
                            height: index == indexImage ? 5 : 2,
                            width: index == indexImage ? 20 : 10,
                            margin: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                color: index == indexImage
                                    ? AppColors.colorBackground
                                    : Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(5)),
                          ),
                        )),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      "Produkt",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                  ),
                  const ListTile(
                    visualDensity: VisualDensity(vertical: -3), // t
                    leading:
                        Icon(Icons.scale, color: AppColors.colorBackground),
                    title: Text(
                      "1,2 tonna",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text("Og'irlik",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.grey)),
                  ),
                  const ListTile(
                    visualDensity: VisualDensity(vertical: -3), // t
                    leading: Icon(Icons.location_on_rounded,
                        color: AppColors.colorBackground),
                    title: Text(
                      "TOSHKENT-MOSKVA",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text("Yo'nalish",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.grey)),
                  ),
                  const ListTile(
                    visualDensity: VisualDensity(vertical: -3), // t
                    leading: Icon(Icons.calendar_month,
                        color: AppColors.colorBackground),
                    title: Text(
                      "12.01.24-16.-1.24",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text("Muddat",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.grey)),
                  ),
                  const ListTile(
                    visualDensity: VisualDensity(vertical: -3), // t
                    leading: Icon(Icons.monetization_on,
                        color: AppColors.colorBackground),
                    title: Text(
                      "\$4000",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text("Narx",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.grey)),
                  ),
                  const ListTile(
                    visualDensity: VisualDensity(vertical: -3), // t
                    leading:
                        Icon(Icons.scale, color: AppColors.colorBackground),
                    title: Text(
                      "Plastik karta, pul ko'chirish",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text("To'lov turi",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.grey)),
                  ),
                  const ListTile(
                    visualDensity: VisualDensity(vertical: -3), // t
                    leading:
                        Icon(Icons.scale, color: AppColors.colorBackground),
                    title: Text(
                      "Maxsulotni belgilangan muddatda yekazishim kerak",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text("Komentary",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.grey)),
                  ),
                  const SizedBox(height: 20),
                  Visibility(
                      visible: visibleUserCont,
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 60,
                                    height: 60,
                                    margin: const EdgeInsets.all(10),
                                    decoration: const BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 1,
                                              spreadRadius: 1)
                                        ],
                                        shape: BoxShape.circle,
                                        color: Colors.grey),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            "https://yt3.googleusercontent.com/ytc/AGIKgqPwtgj5FwEJ7cFln7T_qxosKFA-gCZTtaDbRMhCGw=s900-c-k-c0x00ffffff-no-rj",
                                        alignment: Alignment.topCenter,
                                        width: 50,
                                        height: 55,
                                        fit: BoxFit.cover,
                                        progressIndicatorBuilder: (context, url,
                                                downloadProgress) =>
                                            const CupertinoActivityIndicator(),
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Ruziyev Abduraxmon",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16)),
                                      Text("+99890 123 45 67"),
                                    ],
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                        builder: (context) => ChoosePlan(),
                                      ));
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.arrow_forward_ios,
                                        size: 15, color: Colors.grey),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    _makePhoneCall("+998901234567");
                                  },
                                  child: Container(
                                    margin: EdgeInsets.all(3),
                                    padding: EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade50,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 0.1,
                                              spreadRadius: 0.2)
                                        ]),
                                    child: Column(
                                      children: [
                                        Icon(Icons.phone),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "Qo'ng'iroq",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.all(3),
                                  padding: EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade50,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey,
                                            blurRadius: 1,
                                            spreadRadius: 0.2)
                                      ]),
                                  child: Column(
                                    children: [
                                      Icon(Icons.chat),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Chat",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      )),
                  const SizedBox(height: 20),
                  MaterialButton(
                    onPressed: () {
                      visibleUserCont = !visibleUserCont;
                      animateToLast();
                      setState(() {});
                    },
                    minWidth: MediaQuery.of(context).size.width,
                    color: AppColors.colorBackground,
                    height: 50,
                    elevation: 0,
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.transparent)),
                    child: const Text("Belgilash",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }
}

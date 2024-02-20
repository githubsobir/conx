import 'package:cached_network_image/cached_network_image.dart';
import 'package:conx/root_and_unver_page/unversal_pages/detail_page.dart';
import 'package:conx/widgets/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Center(
          child: Container(
        padding: const EdgeInsets.all(2),
        margin: const EdgeInsets.fromLTRB(15, 3, 15, 3),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
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
                  height: 200,
                  fit: BoxFit.cover,
                  imageUrl: imageUrls[indexImage],
                  alignment: Alignment.topCenter,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
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
            Text(
              "BENZIN",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
            ),
            const SizedBox(height: 10),
            MaterialButton(
              onPressed: () {},
              minWidth: 120,
              color: Colors.green.shade700,
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.transparent)),
              child: const Text(
                "Ko'rish",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 5),
            Row(mainAxisSize: MainAxisSize.min, children: [
              Icon(Icons.screen_rotation_alt, size: 16),
              const SizedBox(width: 4),
              Text(
                "Moskva-Toshkent",
                style: TextStyle(color: AppColors.colorBackground),
              )
            ]),
            const SizedBox(height: 5),
            Text(
              "\$6 000",
              style: TextStyle(
                  color: AppColors.colorBackground,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            const SizedBox(height: 8),
            MaterialButton(
              onPressed: () {
                Navigator.push(context, CupertinoPageRoute(builder: (context) => DetailPage(),));
              },
              minWidth: double.infinity,
              height: 50,
              shape: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(10)),
              color: AppColors.colorBackground,
              child: Text("To'liq ma'lumot",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      )),
    );
  }
}

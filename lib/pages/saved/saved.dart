import 'package:cached_network_image/cached_network_image.dart';
import 'package:conx/root_and_unver_page/unversal_pages/detail_page.dart';
import 'package:conx/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Saved extends ConsumerStatefulWidget {
  const Saved({super.key});

  @override
  ConsumerState<Saved> createState() => _SavedState();
}

class _SavedState extends ConsumerState<Saved> {
  final List<String> imageUrls = [
    'https://fruitgrowersnews.com/wp-content/uploads/2018/07/California-strawberries.jpg',
    "https://avatars.mds.yandex.net/i?id=eaa9ce5c3caa2776986b9acba8e1e3922431db63-9293412-images-thumbs&n=13",
    'https://avatars.mds.yandex.net/i?id=0c901e94b959453fd5ee0ed4b4d5bb42-5225319-images-thumbs&n=13',
    'https://img.promportal.su/foto/good_fotos/2527/25274616/prodam-molodoy-kartofel-optom-v-krasnodarskom-krae_foto_largest.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.greyShade900,
        appBar: AppBar(
          backgroundColor: AppColors.greyShade900,
          title: Text(
            "Saqlanganlar (4)",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.white100,
                fontSize: 22),
          ),
          elevation: 0,
          centerTitle: true,
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: Icon(
                Icons.add_alert,
                color: AppColors.white100,
              ),
            )
          ],
        ),
        body: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Expanded(
                  child: ListView.builder(
                itemCount: imageUrls.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: AppColors.white10,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        ClipRRect(
                          child: CachedNetworkImage(
                              width: 110,
                              height: 150,
                              fit: BoxFit.fitHeight,
                              imageUrl: imageUrls[index]),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Product",
                                style: TextStyle(
                                  color: AppColors.white100,
                                  fontWeight: FontWeight.bold,
                                )),
                            index % 2 == 0
                                ? MaterialButton(
                                    onPressed: () {},
                                    height: 35,
                                    shape: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: Colors.transparent)),
                                    color: Colors.green.shade700,
                                    child: Text("Ko'rish",
                                        style: TextStyle(
                                            color: AppColors.white100)),
                                  )
                                : MaterialButton(
                                    onPressed: () {},
                                    height: 35,
                                    shape: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: Colors.transparent)),
                                    color: Colors.yellowAccent.shade700,
                                    child: Text("Taklifni o'ylab ko'rish",
                                        style: TextStyle(
                                            color: AppColors.greyShade900)),
                                  ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.location_on_rounded,
                                  color: AppColors.white100,
                                  size: 18,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Toshkent-Moskva",
                                  style: TextStyle(
                                      color: AppColors.white100,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            Text(
                              "\$5200",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.white100),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                MaterialButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                          builder: (context) => DetailPage(),
                                        ));
                                  },
                                  minWidth: 120,
                                  height: 35,
                                  shape: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                          color: Colors.transparent)),
                                  color: AppColors.colorBackground,
                                  child: const Text("To'liqroq",
                                      style:
                                          TextStyle(color: AppColors.white100)),
                                ),
                                const SizedBox(width: 10),
                                Container(
                                  decoration: BoxDecoration(
                                      color: AppColors.white10,
                                      borderRadius: BorderRadius.circular(5)),
                                  padding: const EdgeInsets.all(5),
                                  child: const Icon(
                                    Icons.favorite,
                                    color: AppColors.colorBackground,
                                  ),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
              ))
            ],
          ),
        ));
  }
}

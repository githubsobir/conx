import 'package:cached_network_image/cached_network_image.dart';
import 'package:conx/root_and_unver_page/unversal_pages/detail_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class SearchAll extends StatefulWidget {
  const SearchAll({super.key});

  @override
  State<SearchAll> createState() => _SearchAllState();
}

final List<String> imageUrls = [
  'https://fruitgrowersnews.com/wp-content/uploads/2018/07/California-strawberries.jpg',
  "https://avatars.mds.yandex.net/i?id=eaa9ce5c3caa2776986b9acba8e1e3922431db63-9293412-images-thumbs&n=13",
  'https://avatars.mds.yandex.net/i?id=0c901e94b959453fd5ee0ed4b4d5bb42-5225319-images-thumbs&n=13',
  'https://img.promportal.su/foto/good_fotos/2527/25274616/prodam-molodoy-kartofel-optom-v-krasnodarskom-krae_foto_largest.jpg',
  "https://agromer-storage-public.storage.yandexcloud.net/st/images/2469/offers/69e711ff-5d18-4865-800b-b6a0466d5f9c/748de53fa5c6f7850c5dc1ff67122b3c.jpg"
];

class _SearchAllState extends State<SearchAll> {
  final List<String> items = List.generate(20, (index) => 'Item $index');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          title: Container(
            padding: const EdgeInsets.all(1.0),
            child: Column(
              children: [
                SizedBox(
                  height: 55,
                  child: TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                                const BorderSide(color: Colors.transparent)),
                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                                const BorderSide(color: Colors.transparent)),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(30)),
                        hoverColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                                BorderSide(color: Colors.grey.shade200)),
                        fillColor: Colors.grey.shade400,
                        filled: true),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Container(
            margin:
                const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 15),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 0,
                mainAxisSpacing: 1,
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Handle item tap
                   Navigator.push(context,CupertinoPageRoute(builder: (context) => DetailPage(),));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          width: 120,
                          height: 180,
                          imageUrl: imageUrls[index < 5 ? index : index % 5],
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
                            strokeWidth: 0,

                            /// Optional, The stroke of the line, only applicable to widget which contains line
                            backgroundColor: Colors.white,

                            /// Optional, Background of the widget

                            pathBackgroundColor: Colors.black

                          /// Optional, the stroke backgroundColor
                        ),
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                      ),
                    ),
                  ),
                );
              },
            )));
  }
}

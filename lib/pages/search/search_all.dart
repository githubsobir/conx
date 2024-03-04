import 'package:cached_network_image/cached_network_image.dart';
import 'package:conx/generated/assets.dart';
import 'package:conx/pages/search/search_details/search_details.dart';
import 'package:conx/theme/app_colors.dart';
import 'package:conx/widgets/background_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
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
  final TextEditingController _textEditControllerSearch = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        const BackgroundWidget(),
        SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment. spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(width: 1),
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 5, 5, 10),
                    height: 65,
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: TextFormField(
                      controller: _textEditControllerSearch,
                      style: TextStyle(
                          color: AppColors.white100,
                          fontWeight: FontWeight.bold),
                      cursorColor: AppColors.white100,
                      decoration: InputDecoration(

                          counter: const SizedBox.shrink(),
                          prefixIcon: Icon(
                            CupertinoIcons.search,
                            color: AppColors.white100,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35)),
                          fillColor: AppColors.white20,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35)),
                          filled: true),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.white20,
                    ),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => const SearchDetails(),
                              ));
                        },
                        child: SvgPicture.asset(
                          Assets.imagesLinear,
                          width: 20,
                          height: 20,
                        )),
                  ),
                  const SizedBox(width: 1),
                ],
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 120,
                      childAspectRatio: 1,
                      mainAxisExtent: 150,
                      mainAxisSpacing: 0,
                      crossAxisSpacing: 0),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     CupertinoPageRoute(
                        //       builder: (context) => DetailPage(),
                        //     ));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2.0),
                        ),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            width: 120,
                            height: 180,
                            imageUrl: imageUrls[index < 5 ? index : index % 5],
                            alignment: Alignment.topCenter,
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) =>
                                    const LoadingIndicator(
                                        indicatorType: Indicator.ballPulse,
                                        colors: [
                                          Colors.red,
                                          Colors.orange,
                                          Colors.yellow,
                                          Colors.green,
                                          Colors.blue,
                                          Colors.indigo,
                                          Colors.purple,
                                        ],
                                        strokeWidth: 0,
                                        backgroundColor: Colors.white,
                                        pathBackgroundColor: Colors.black),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}

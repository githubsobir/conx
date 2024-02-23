import 'package:conx/pages/active_orders/driver/info_window/model_product/model_product.dart';
import 'package:conx/root_and_unver_page/unversal_pages/detail_page.dart';
import 'package:conx/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomInfoWindows extends StatefulWidget {
  int id;

  CustomInfoWindows({super.key, required this.id});

  @override
  State<CustomInfoWindows> createState() => _CustomInfoWindowState();
}

class _CustomInfoWindowState extends State<CustomInfoWindows> {
  final List<String> imageUrls = [
    'https://fruitgrowersnews.com/wp-content/uploads/2018/07/California-strawberries.jpg',
    "https://avatars.mds.yandex.net/i?id=eaa9ce5c3caa2776986b9acba8e1e3922431db63-9293412-images-thumbs&n=13",
    'https://avatars.mds.yandex.net/i?id=0c901e94b959453fd5ee0ed4b4d5bb42-5225319-images-thumbs&n=13',
    'https://img.promportal.su/foto/good_fotos/2527/25274616/prodam-molodoy-kartofel-optom-v-krasnodarskom-krae_foto_largest.jpg',
    "https://agromer-storage-public.storage.yandexcloud.net/st/images/2469/offers/69e711ff-5d18-4865-800b-b6a0466d5f9c/748de53fa5c6f7850c5dc1ff67122b3c.jpg"
  ]; //
  List<MadelProducts> listModelProduct = [
    MadelProducts(status: "1", image: ImageProducts(id: "1", img: 'https://fruitgrowersnews.com/wp-content/uploads/2018/07/California-strawberries.jpg',), title: "1-maxsulot", text: "1-maxsulot xaqida qisqacha ma'lumot", price: "500", date: "2002-10-10"),
    MadelProducts(status: "2", image: ImageProducts(id: "2", img: "https://avatars.mds.yandex.net/i?id=eaa9ce5c3caa2776986b9acba8e1e3922431db63-9293412-images-thumbs&n=13",), title: "2-maxsulot", text: "1-maxsulot xaqida qisqacha ma'lumot", price: "800", date: "2002-10-10"),
    MadelProducts(status: "3", image: ImageProducts(id: "3", img: 'https://avatars.mds.yandex.net/i?id=0c901e94b959453fd5ee0ed4b4d5bb42-5225319-images-thumbs&n=13',), title: "3-maxsulot", text: "3-maxsulot xaqida qisqacha ma'lumot", price: "500", date: "2002-10-10"),
    MadelProducts(status: "4", image: ImageProducts(id: "4", img: 'https://img.promportal.su/foto/good_fotos/2527/25274616/prodam-molodoy-kartofel-optom-v-krasnodarskom-krae_foto_largest.jpg',), title: "1-maxsulot", text: "4-maxsulot xaqida qisqacha ma'lumot", price: "100", date: "2002-10-10"),
    MadelProducts(status: "5", image: ImageProducts(id: "5", img: 'https://fruitgrowersnews.com/wp-content/uploads/2018/07/California-strawberries.jpg',), title: "1-maxsulot", text: "4-maxsulot xaqida qisqacha ma'lumot", price: "500", date: "2002-10-10"),
    MadelProducts(status: "6", image: ImageProducts(id: "6", img: 'https://img.promportal.su/foto/good_fotos/2527/25274616/prodam-molodoy-kartofel-optom-v-krasnodarskom-krae_foto_largest.jpg',), title: "5-maxsulot", text: "1-maxsulot xaqida qisqacha ma'lumot", price: "190", date: "2002-10-10"),
    MadelProducts(status: "7", image: ImageProducts(id: "7", img:  "https://agromer-storage-public.storage.yandexcloud.net/st/images/2469/offers/69e711ff-5d18-4865-800b-b6a0466d5f9c/748de53fa5c6f7850c5dc1ff67122b3c.jpg",), title: "6-maxsulot", text: "1-maxsulot xaqida qisqacha ma'lumot", price: "222", date: "2002-10-10"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: 200,
          width: MediaQuery.of(context).size.width * 0.7,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 100,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(imageUrls[widget.id]),
                        fit: BoxFit.cover)),
              ),
              Container(
                margin: EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Maxsulot ${listModelProduct[widget.id].title}",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.location_on_rounded, size: 17),
                        SizedBox(
                            width: 140,
                            child: Text("TASHKENT-MOSKOV",
                                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12)))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: 110,
                            child: Text(" \$ ${listModelProduct[widget.id].price} dollor",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.blue.shade900)))
                      ],
                    ),
                    MaterialButton(height: 40,
                    minWidth: MediaQuery.of(context).size.width * 0.3,
                    color: AppColors.colorBackground,
                    onPressed: (){
                      Navigator.push(context,CupertinoPageRoute(builder: (context) => DetailPage(),));
                    },
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: const Text("Ko'rish", style: TextStyle(color: Colors.white)),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

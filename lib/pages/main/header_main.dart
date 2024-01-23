import 'package:cached_network_image/cached_network_image.dart';
import 'package:conx/widgets/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeaderMain extends StatefulWidget {
  const HeaderMain({super.key});

  @override
  State<HeaderMain> createState() => _HeaderMainState();
}

class _HeaderMainState extends State<HeaderMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Container(
        height: 420,
        margin: const EdgeInsets.fromLTRB(25, 10, 25, 10),
        decoration: BoxDecoration(
            color: Colors.grey.shade50,
            borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [

            Visibility(
              visible: true,
              child: Column(children: [
                ListTile(
                  onTap: () {},
                  leading:
                  const Icon(Icons.my_location_outlined, color: Colors.grey),
                  title:
                  const Text("Qayerdan", style: TextStyle(color: Colors.grey)),
                  trailing: const Icon(Icons.keyboard_arrow_down_rounded,
                      size: 32, color: Colors.grey),
                ),
                Divider(color: Colors.grey.shade200),
                ListTile(
                  onTap: () {},
                  leading:
                  const Icon(CupertinoIcons.location_solid, color: Colors.grey),
                  title:
                  const Text("Qayerga", style: TextStyle(color: Colors.grey)),
                  trailing: const Icon(Icons.keyboard_arrow_down_rounded,
                      size: 32, color: Colors.grey),
                ),
                Divider(color: Colors.grey.shade200),
                ListTile(
                  onTap: () {},
                  leading: const Icon(Icons.calendar_month, color: Colors.grey),
                  title: const Text("Sesh, 16 yan-Chor, 17 yan",
                      style: TextStyle(color: Colors.grey)),
                ),
                MaterialButton(
                  onPressed: () {},
                  minWidth: MediaQuery.of(context).size.width,
                  height: 50,
                  shape: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.zero,
                        topRight: Radius.zero,
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      )),
                  color: AppColors.colorBackground,
                  child: const Text("Qidirish",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 15),
              ],),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: const Text("Logistik kompaniya",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 22)),
                ),
                const Text("Hammasini ko'rish"),

              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
                height: 110,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 20,
                  itemBuilder: (context, index) => Column(
                    children: [
                      Container(
                        width: 65,
                        height: 65,
                        padding: const EdgeInsets.all(3),
                        margin: const EdgeInsets.fromLTRB(5,2,5,2),
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(colors: [
                              AppColors.colorBackground,
                              Colors.white,
                              AppColors.colorBackground,
                              AppColors.colorBackground,
                              AppColors.colorBackground,
                            ]),
                            shape: BoxShape.circle,
                            color: Colors.grey),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: CachedNetworkImage(
                            imageUrl: index % 2 == 0
                                ? "https://vectorportal.com/storage/x-vplogo1b_3108.jpg"
                                : "https://avatars.mds.yandex.net/i?id=01acf525d652cf7169d54ed7aea9874c6f7aeb17-11459613-images-thumbs&n=13",
                            alignment: Alignment.topCenter,
                            fit: BoxFit.fill,
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) =>
                                    const CupertinoActivityIndicator(),
                            errorWidget: (context, url, error) =>
                               const Icon(Icons.error),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(5,0,5,0),
                        child: Text(
                          "companiya\n nomi",
                          maxLines: 2,
                          style: TextStyle(fontSize: 12),
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

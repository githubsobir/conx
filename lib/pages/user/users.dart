import 'package:cached_network_image/cached_network_image.dart';
import 'package:conx/generated/assets.dart';
import 'package:conx/pages/user/model_user/model_profile_list.dart';
import 'package:conx/pages/user/orders/orders.dart';
import 'package:conx/pages/user/user_profile/user_profiles.dart';
import 'package:conx/pages/user/user_time_end/user_time_end.dart';
import 'package:conx/root_and_unver_page/root_page.dart';
import 'package:conx/theme/app_colors.dart';
import 'package:conx/widgets/background_widget.dart';
import 'package:conx/widgets/chart_pie.dart';
import 'package:conx/widgets/saved_box.dart';
import 'package:easy_pie_chart/easy_pie_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Users extends StatefulWidget {
  const Users({super.key});

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
  var box = HiveBoxes();
  final List<PieData> pies = [
    PieData(value: 0.24, color: AppColors.newOrangeColorForIcon),
    PieData(value: 0.75, color: AppColors.white100),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundWidget(),
          SafeArea(
            child: Container(
              margin: const EdgeInsets.all(20),
              child: Column(
                children: [
                  AppBar(
                    title: Text(
                      "Profile",
                      style: TextStyle(
                        color: AppColors.white100,
                      ),
                    ),
                    elevation: 0,
                    backgroundColor: AppColors.transparent,
                    centerTitle: true,
                    iconTheme: IconThemeData(color: AppColors.white100),
                    actions: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.add_alert)),
                      )
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: listProfile.length,
                      itemBuilder: (context, index) => index == 0
                          ? Container(
                              height: 160,
                              padding: const EdgeInsets.only(left: 20),
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(Assets.imagesRoad4),
                                      filterQuality: FilterQuality.high,
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5),
                                      bottomLeft: Radius.circular(25),
                                      bottomRight: Radius.circular(25))),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey.shade400,
                                                width: 4),
                                            shape: BoxShape.circle),
                                        margin:
                                            const EdgeInsets.only(right: 10),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          child: CachedNetworkImage(
                                            imageUrl:
                                                "https://avatars.mds.yandex.net/i?id=b859fb3e4d26c064309108b7a960b807a95dda75-4455006-images-thumbs&n=13",
                                            alignment: Alignment.topCenter,
                                            width: 80,
                                            height: 80,
                                            fit: BoxFit.cover,
                                            progressIndicatorBuilder: (context,
                                                    url, downloadProgress) =>
                                                const CupertinoActivityIndicator(),
                                            errorWidget:
                                                (context, url, error) =>
                                                    const Icon(Icons.error),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 100,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            const SizedBox(height: 30),
                                            Text(
                                              box.userFName,
                                              maxLines: 1,
                                              overflow: TextOverflow.fade,
                                              softWrap: true,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                            ),
                                            Text(
                                              box.userName,
                                              maxLines: 1,
                                              overflow: TextOverflow.fade,
                                              softWrap: true,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                            ),
                                          ],
                                        ),
                                      ),
                                      AppChartPie(
                                          pies: pies,
                                          text1: "Позитивный",
                                          text2: "Негативный"),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        height: 28,
                                        width: 173,
                                        margin: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                            color:
                                                AppColors.newOrangeColorForIcon,
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: const Center(
                                            child:
                                                Text("Думает о предложении")),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          : Container(
                              height: 56,
                              margin: const EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: const DecorationImage(
                                      image: AssetImage(Assets.imagesRoad3),
                                      fit: BoxFit.cover)),
                              child: ListTile(
                                onTap: () {
                                  openPageController(indexList: index);
                                },
                                leading: listProfile[index].icons,
                                title: Text(
                                  listProfile[index].text,
                                  style: TextStyle(color: AppColors.white100),
                                ),
                                trailing: Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  color: AppColors.newOrangeColorForIcon,
                                ),
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  openPageController({required int indexList}) {
    switch (indexList) {
      case 1:
        {
          Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => const Orders(),
              ));
        }
      case 2:
        {}
      case 3:
        {
          Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => const UserProfiles(),
              ));
        }
      case 4:
        {
          Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => const UserTimeEnd(),
              ));
        }
      case 8:
        {
          showDialog(
            context: context,
            builder: (context) => SizedBox(
              height: 180,
              width: MediaQuery.of(context).size.width * 0.6,
              child: AlertDialog(
                backgroundColor: AppColors.black,
                title: Text(
                  "SaNX",
                  style: TextStyle(color: AppColors.background),
                  textAlign: TextAlign.center,
                ),
                content: Text(
                  "Tizimda chiqmoqchimisiz",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppColors.background, fontWeight: FontWeight.bold, fontSize: 18),
                ),
                actions: [
                  Row(
                    children: [
                      Expanded(
                          child: GestureDetector(
                        child: Text(
                          "XA",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: AppColors.background, fontSize: 18),
                        ),
                        onTap: () {
                          box.deleteAllBox();
                          Navigator.pushAndRemoveUntil(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => RootPage(),
                              ),
                              (route) => false);
                        },
                      )),
                      Expanded(
                          child: GestureDetector(
                        child: Text(
                          "YOQ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: AppColors.background, fontSize: 18),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      )),
                    ],
                  )
                ],
              ),
            ),
          );
        }
    }
  }

  List<ModelProfileList> listProfile = [
    ModelProfileList(
        id: "0",
        icons: Icon(
          CupertinoIcons.cart,
          color: AppColors.newOrangeColorForIcon,
        ),
        text: "Вставит Заказы",
        note: ""),
    ModelProfileList(
        id: "1",
        icons: Icon(
          CupertinoIcons.cart,
          color: AppColors.newOrangeColorForIcon,
        ),
        text: "Мои Заказы",
        note: ""),
    ModelProfileList(
        id: "2",
        icons: Icon(
          Icons.history,
          color: AppColors.newOrangeColorForIcon,
        ),
        text: "История заказа",
        note: ""),
    ModelProfileList(
        id: "3",
        icons: Icon(
          Icons.settings,
          color: AppColors.newOrangeColorForIcon,
        ),
        text: "Настройки профиля",
        note: ""),
    ModelProfileList(
        id: "4",
        icons: Icon(
          Icons.timer,
          color: AppColors.newOrangeColorForIcon,
        ),
        text: "Время окончания тарифа",
        note: ""),
    ModelProfileList(
        id: "5",
        icons: Icon(
          Icons.image,
          color: AppColors.newOrangeColorForIcon,
        ),
        text: "Галерея автомобилей",
        note: ""),
    ModelProfileList(
        id: "6",
        icons: Icon(
          Icons.question_answer_outlined,
          color: AppColors.newOrangeColorForIcon,
        ),
        text: "Часто задаваемые вопросы",
        note: ""),
    ModelProfileList(
        id: "7",
        icons: Icon(
          Icons.stacked_line_chart,
          color: AppColors.newOrangeColorForIcon,
        ),
        text: "Статистика",
        note: ""),
    ModelProfileList(
        id: "8",
        icons: Icon(
          Icons.exit_to_app,
          color: AppColors.newOrangeColorForIcon,
        ),
        text: "Выйти",
        note: ""),
  ];
}

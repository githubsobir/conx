import 'package:cached_network_image/cached_network_image.dart';
import 'package:conx/generated/assets.dart';
import 'package:conx/pages/user/model_user/model_profile_list.dart';
import 'package:conx/pages/user/user_profile/user_profiles.dart';
import 'package:conx/pages/user/user_time_end/user_time_end.dart';
import 'package:conx/theme/app_colors.dart';
import 'package:conx/widgets/background_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Users extends StatefulWidget {
  const Users({super.key});

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(
            color: AppColors.white100,
          ),
        ),
        elevation: 0,
        backgroundColor: AppColors.background,
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.white100),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child:
                IconButton(onPressed: () {}, icon: const Icon(Icons.add_alert)),
          )
        ],
      ),
      body: Stack(
        children: [
          const BackgroundWidget(),
          SafeArea(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  decoration: BoxDecoration(
                      color: AppColors.primaryButton,
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25))),
                  child: Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.grey.shade400, width: 4),
                              shape: BoxShape.circle),
                          margin: const EdgeInsets.only(right: 20),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: CachedNetworkImage(
                              imageUrl:
                                  "https://yt3.googleusercontent.com/ytc/AGIKgqPwtgj5FwEJ7cFln7T_qxosKFA-gCZTtaDbRMhCGw=s900-c-k-c0x00ffffff-no-rj",
                              alignment: Alignment.topCenter,
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) =>
                                      const CupertinoActivityIndicator(),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "FIO",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            Container(
                              width: 200,
                              height: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.yellow),
                              child: const Center(
                                child: Text(
                                  "FIO",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(15),
                    child: ListView.builder(
                      itemCount: listProfile.length,
                      itemBuilder: (context, index) => Container(
                        height: 56,
                        margin: const EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                            image:const  DecorationImage(
                                image: AssetImage(Assets.imagesRoad3),

                                fit: BoxFit.cover)),
                        child:   ListTile(
                          onTap: () {
                            if (index == 0) {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) => UserProfiles(),
                                  ));
                            } else if (index == 1) {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) =>
                                    const UserTimeEnd(),
                                  ));
                            }
                          },
                          leading: listProfile[index].icons,
                          title: Text(
                            listProfile[index].text,
                            style: TextStyle(color: AppColors.white100),
                          ),
                          trailing:
                           Icon(Icons.arrow_forward_ios_outlined, color: AppColors.newOrangeColorForIcon,),
                        ),
                      ),
                    ),
                  ),
                ),
                MaterialButton(
                  onPressed: () {},
                  height: 60,
                  minWidth: MediaQuery.of(context).size.width * 0.9,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.output,color: AppColors.white100),
                        const SizedBox(width: 10),
                        Text("Выйти", style: TextStyle(color: AppColors.white100),)
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<ModelProfileList> listProfile = [
    ModelProfileList(
        id: "1",
        icons: Icon(
          Icons.settings,
          color: AppColors.newOrangeColorForIcon,
        ),
        text: "Настройки профиля",
        note: ""),
    ModelProfileList(
        id: "2",
        icons: Icon(Icons.timer,
          color: AppColors.newOrangeColorForIcon,
        ),
        text: "Время окончания тарифа",
        note: ""),
    ModelProfileList(
        id: "3",
        icons: Icon(Icons.image,
          color: AppColors.newOrangeColorForIcon,
        ),
        text: "Галерея автомобилей",
        note: ""),
    ModelProfileList(
        id: "4", icons: Icon(Icons.history,   color: AppColors.newOrangeColorForIcon,), text: "История заказа", note: ""),
    ModelProfileList(
        id: "5", icons: Icon(Icons.shopping_cart,    color: AppColors.newOrangeColorForIcon,), text: "Заказы", note: ""),
    ModelProfileList(
        id: "6",
        icons: Icon(Icons.question_answer_outlined,    color: AppColors.newOrangeColorForIcon,),
        text: "Часто задаваемые вопросы",
        note: ""),
    ModelProfileList(
        id: "6",
        icons: Icon(Icons.stacked_line_chart,    color: AppColors.newOrangeColorForIcon,),
        text: "Статистика",
        note: ""),
  ];
}

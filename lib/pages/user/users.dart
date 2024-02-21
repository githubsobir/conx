import 'package:cached_network_image/cached_network_image.dart';
import 'package:conx/pages/user/model_user/model_profile_list.dart';
import 'package:conx/pages/user/user_profile/user_profiles.dart';
import 'package:conx/pages/user/user_time_end/user_time_end.dart';
import 'package:conx/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          title: Text("Profile"),
          elevation: 0,
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(onPressed: () {}, icon: const Icon(Icons.add_alert)),
            )
          ],
          backgroundColor: AppColors.colorBackground),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              decoration: const BoxDecoration(
                  color: AppColors.colorBackground,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25))),
              child: Container(
                margin: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.grey.shade400, width: 4),
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
                          child:const  Center(
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
                  itemBuilder: (context, index) => Card(
                    child: ListTile(
                      onTap: () {
                        if(index == 0) {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => UserProfiles(),
                              ));
                        }

                        else if(index == 1){

                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) =>const UserTimeEnd(),
                              ));
                        }
                      },
                      leading: listProfile[index].icons,
                      title: Text(listProfile[index].text),
                      trailing: const Icon(Icons.arrow_forward_ios_outlined),
                    ),
                  ),
                ),
              ),
            ),
            MaterialButton(
              onPressed: () {},
              height: 60,
              minWidth: MediaQuery.of(context).size.width * 0.9,
              color: AppColors.colorBackground,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.output),
                    SizedBox(width: 10),
                    Text("Выйти")
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  List<ModelProfileList> listProfile = [
    ModelProfileList(
        id: "1",
        icons: Icon(Icons.settings),
        text: "Настройки профиля",
        note: ""),
    ModelProfileList(
        id: "2",
        icons: Icon(Icons.timer),
        text: "Время окончания тарифа",
        note: ""),
    ModelProfileList(
        id: "3",
        icons: Icon(Icons.image),
        text: "Галерея автомобилей",
        note: ""),
    ModelProfileList(
        id: "4", icons: Icon(Icons.history), text: "История заказа", note: ""),
    ModelProfileList(
        id: "5", icons: Icon(Icons.shopping_cart), text: "Заказы", note: ""),
    ModelProfileList(
        id: "6",
        icons: Icon(Icons.question_answer_outlined),
        text: "Часто задаваемые вопросы",
        note: ""),
  ];
}

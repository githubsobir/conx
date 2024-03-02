import 'package:cached_network_image/cached_network_image.dart';
import 'package:conx/generated/assets.dart';
import 'package:conx/theme/app_colors.dart';
import 'package:conx/widgets/background_widget.dart';
import 'package:conx/widgets/primary_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UserProfiles extends StatefulWidget {
  const UserProfiles({super.key});

  @override
  State<UserProfiles> createState() => _UserProfilesState();
}

class _UserProfilesState extends State<UserProfiles> {
  late DateTime selectedDate = DateTime.now();
  bool boolSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      const BackgroundWidget(),
      SafeArea(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            children: [
              AppBar(
                backgroundColor: AppColors.transparent,
                title: Text(
                  "Настройки профиля",
                  style: TextStyle(color: AppColors.white100),
                ),
                iconTheme: IconThemeData(color: AppColors.white100),
                centerTitle: true,
                elevation: 0,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
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
                          Icon(
                            Icons.photo_camera_outlined,
                            color: AppColors.white100,
                          )
                        ],
                      ),
                      const SizedBox(height: 30),
                      Text(
                        "Имя",
                        style: TextStyle(
                          color: AppColors.white100,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 56,
                        padding:const EdgeInsets.only(left: 12),
                        decoration: const BoxDecoration(
                          image: DecorationImage(image: AssetImage(Assets.imagesRoad4), fit: BoxFit.fill)
                        ),
                        child: TextFormField(
                          maxLines: 1,
                          maxLength: 30,
                          keyboardType: TextInputType.text,
                          style: TextStyle(color: AppColors.white100),
                          decoration: const InputDecoration(
                              counter:  SizedBox.shrink(),
                              border: InputBorder.none,

                              prefix: Text(
                                "",
                                style:  TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              )),
                          validator: (value) {
                            if (value.toString().length <= 8) {
                              return "xato";
                            } else {
                              return "";
                            }
                          },
                        ),
                      ),
                     const SizedBox(height: 10),
                      Text(
                        "Фамилия",
                        style: TextStyle(
                          color: AppColors.white100,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 56,
                        padding:const EdgeInsets.only(left: 12),
                        decoration: const BoxDecoration(
                            image: DecorationImage(image: AssetImage(Assets.imagesRoad4), fit: BoxFit.fill)
                        ),
                        child: TextFormField(
                          maxLines: 1,
                          maxLength: 30,
                          keyboardType: TextInputType.text,
                          style: TextStyle(color: AppColors.white100),
                          decoration: const InputDecoration(
                              counter:  SizedBox.shrink(),
                              border: InputBorder.none,

                              prefix: Text(
                                "",
                                style:  TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              )),
                          validator: (value) {
                            if (value.toString().length <= 8) {
                              return "xato";
                            } else {
                              return "";
                            }
                          },
                        ),
                      ),
                      Text(
                        "Отчества",
                        style: TextStyle(
                          color: AppColors.white100,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 56,
                        padding:const EdgeInsets.only(left: 12),
                        decoration: const BoxDecoration(
                            image: DecorationImage(image: AssetImage(Assets.imagesRoad4), fit: BoxFit.fill)
                        ),
                        child: TextFormField(
                          maxLines: 1,
                          maxLength: 30,
                          keyboardType: TextInputType.text,
                          style: TextStyle(color: AppColors.white100),
                          decoration: const InputDecoration(
                              counter:  SizedBox.shrink(),
                              border: InputBorder.none,

                              prefix: Text(
                                "",
                                style:  TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              )),
                          validator: (value) {
                            if (value.toString().length <= 8) {
                              return "xato";
                            } else {
                              return "";
                            }
                          },
                        ),
                      ),
                     const SizedBox(height: 10),
                      Text(
                        "Дата рождения",
                        style: TextStyle(
                          color: AppColors.white100,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _selectDate(context);
                        },
                        child: Container(
                            height: 56,
                            width: double.infinity,
                            padding: const EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(

                                borderRadius: BorderRadius.circular(10),
                               image: const DecorationImage(image: AssetImage(Assets.imagesRoad4), fit: BoxFit.fill)),
                            child: Row(
                              children: [
                                boolSelected
                                    ? Text(DateFormat('yyyy-MM-dd')
                                        .format(selectedDate), style: TextStyle(color: AppColors.white100, fontWeight: FontWeight.bold),)
                                    : const SizedBox(),
                              ],
                            )),
                      ),
                     const SizedBox(height: 10),
                      Text(
                        "Телефон номер",
                        style: TextStyle(
                          color: AppColors.white100,
                        ),
                      ),
                      Container(
                        height: 56,
                        padding:const EdgeInsets.only(left: 12),
                        decoration: const BoxDecoration(
                            image: DecorationImage(image: AssetImage(Assets.imagesRoad4),
                                fit: BoxFit.fill, )
                        ),
                        child: TextFormField(
                          maxLines: 1,
                          maxLength: 30,
                          keyboardType: TextInputType.phone,
                          style: TextStyle(color: AppColors.white100),
                          decoration: const InputDecoration(
                              counter:  SizedBox.shrink(),
                              border: InputBorder.none,

                              prefix: Text(
                                "",
                                style:  TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              )),
                          validator: (value) {
                            if (value.toString().length <= 8) {
                              return "xato";
                            } else {
                              return "";
                            }
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Направление",
                        style: TextStyle(
                          color: AppColors.white100,
                        ),
                      ),
                       Container(
                        height: 56,
                        padding:const EdgeInsets.only(left: 12),
                        decoration: const BoxDecoration(
                            image: DecorationImage(image: AssetImage(Assets.imagesRoad4),
                              fit: BoxFit.fill, )
                        ),
                        child: ListTile(
                          title: Text(""),
                          trailing: Icon(
                            Icons.keyboard_arrow_down_sharp,
                            color: AppColors.white100,
                            size: 32,
                          ),
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.import_export,
                            size: 32,
                            color: AppColors.newOrangeColorForIcon,
                          ),
                        ],
                      ),
                      Text(
                        "Направление",
                        style: TextStyle(
                          color: AppColors.white100,
                        ),
                      ),
                      Container(
                       height: 56,
                       padding:const EdgeInsets.only(left: 12),
                       decoration: const BoxDecoration(
                           image: DecorationImage(image: AssetImage(Assets.imagesRoad4),
                             fit: BoxFit.fill, )
                       ),
                        child: ListTile(
                          title: Text(""),
                          trailing: Icon(
                            Icons.keyboard_arrow_down_sharp,
                            color: AppColors.white100,
                            size: 32,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Комментарий",
                        style: TextStyle(color: AppColors.white100),
                      ),
                      Container(
                        height: 120,
                        decoration: BoxDecoration(

                          image: DecorationImage(image: AssetImage(Assets.imagesRoad4), fit: BoxFit.fill),
                            borderRadius: BorderRadius.circular(14)),
                      ),
                      const SizedBox(height: 20),
                      PrimaryButton(onPressed: () {}, text: "Сохранить")
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      )
    ]));
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime picked = await showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 230,
          color: Colors.white,
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  padding: const EdgeInsets.only(right: 20, top: 20),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [Icon(Icons.check)],
                  ),
                ),
              ),
              SizedBox(
                height: 180,
                child: CupertinoDatePicker(
                  initialDateTime: selectedDate,
                  onDateTimeChanged: (DateTime newDate) {
                    setState(() {
                      selectedDate = newDate;
                      boolSelected = true;
                    });
                  },
                  mode: CupertinoDatePickerMode.date,
                  minimumDate: DateTime(2024),
                  maximumDate: DateTime(2030),
                ),
              ),
            ],
          ),
        );
      },
    );

    if (picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
}

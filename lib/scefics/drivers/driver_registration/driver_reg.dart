import 'package:conx/generated/assets.dart';
import 'package:conx/root_and_unver_page/root_page.dart';
import 'package:conx/scefics/drivers/cargo_transport/cargo_transport.dart';
import 'package:conx/scefics/drivers/choose_rate/choose_rate.dart';
import 'package:conx/scefics/drivers/driver_registration/controller_driver_reg.dart';
import 'package:conx/scefics/drivers/driver_registration/driver_choose_company/driver_choose_company.dart';
import 'package:conx/scefics/drivers/driver_registration/driver_license/driver_license.dart';
import 'package:conx/scefics/drivers/driver_registration/model_driver/model_driver_model.dart';
import 'package:conx/scefics/drivers/passport/passport.dart';
import 'package:conx/scefics/drivers/photo_car/photo_car_driver.dart';
import 'package:conx/scefics/drivers/tex_car/tex_car.dart';
import 'package:conx/theme/app_colors.dart';
import 'package:conx/widgets/background_widget.dart';
import 'package:conx/widgets/primary_button.dart';
import 'package:conx/widgets/saved_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DrawerRegistration extends ConsumerStatefulWidget {
  const DrawerRegistration({super.key});

  @override
  ConsumerState<DrawerRegistration> createState() => _DrawerRegistrationState();
}

class _DrawerRegistrationState extends ConsumerState<DrawerRegistration> {
  var box = HiveBoxes();

  @override
  void initState() {
    print(box.userToken.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.white100),
      ),
      body: Stack(
        children: [
          const BackgroundWidget(),
          SingleChildScrollView(
            child: Column(
              children: [
                // IconButton(onPressed: (){}, icon:Icon(Platform.isIOS? Icons.arrow_back_ios:Icons.arrow_back)),
                Container(
                  height: MediaQuery.of(context).size.height * 0.17,
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30)),
                      color: AppColors.colorBackground),
                  child: const Align(
                    alignment: Alignment.bottomCenter,
                    child: ListTile(
                      title: Text("Онлайн регистрация",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30)),

                      subtitle: Text("Для регистрации нам нужны эти данные",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal)),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  margin: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          Icon(
                            Icons.account_box_outlined,
                            color: AppColors.colorBackground,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Удостоверение личности",
                            style: TextStyle(
                                color: AppColors.colorBackground,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: listDriverModel.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: const DecorationImage(
                                      image: AssetImage(Assets.imagesRoad3),
                                      fit: BoxFit.cover)),
                              child: ListTile(
                                onTap: () {
                                  switch (listDriverModel[index].action) {
                                    case "1":
                                      Navigator.push(
                                          context,
                                          CupertinoPageRoute(
                                            builder: (context) =>
                                                const Passport(),
                                          ));
                                    case "2":
                                      Navigator.push(
                                          context,
                                          CupertinoPageRoute(
                                            builder: (context) =>
                                                const DriverLicense(),
                                          ));
                                    case "3":
                                      Navigator.push(
                                          context,
                                          CupertinoPageRoute(
                                            builder: (context) =>
                                                const DriverChooseCompany(),
                                          ));
                                    case "4":
                                      Navigator.push(
                                          context,
                                          CupertinoPageRoute(
                                            builder: (context) =>
                                                const ChooseRate(),
                                          ));
                                  }
                                },
                                title: Text(
                                  listDriverModel[index].name,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.white100),
                                ),
                                trailing: SizedBox(
                                    width: 50,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        ref
                                                    .watch(controllerDriverReg)
                                                    .list[index] ==
                                                "1"
                                            ? const Icon(
                                                Icons.check_circle_outline,
                                                color:
                                                    AppColors.colorBackground)
                                            : const SizedBox.shrink(),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          color: AppColors.white100,
                                        ),
                                      ],
                                    )),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 14),
                      const Row(
                        children: [
                          Icon(
                            Icons.local_shipping_outlined,
                            color: AppColors.colorBackground,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Данные о транспорте",
                            style: TextStyle(color: AppColors.colorBackground),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.28,
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: listCarInfoList.length,
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: const  DecorationImage(
                                      image: AssetImage(Assets.imagesRoad3),
                                      fit: BoxFit.cover)),
                              child: ListTile(
                                onTap: () {
                                  if (index == 0) {
                                    Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                          builder: (context) =>
                                              const CargoTransport(),
                                        ));
                                  } else if (index == 1) {
                                    Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                          builder: (context) =>
                                          const TextCarEnterInfo(),
                                        ));
                                  } else if (index == 2) {
                                    Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                          builder: (context) =>
                                          const PhotoCarDriver(),
                                        ));
                                  }
                                },
                                title: Text(
                                  listCarInfoList[index],
                                  style: TextStyle(
                                      color: AppColors.white100,
                                      fontWeight: FontWeight.w500),
                                ),
                                trailing: SizedBox(
                                    width: 50,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        ref
                                                    .watch(controllerDriverReg)
                                                    .list[index + 4] ==
                                                "1"
                                            ? const Icon(
                                                Icons.check_circle_outline,
                                                color:
                                                    AppColors.colorBackground)
                                            : const SizedBox.shrink(),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          color: AppColors.white100,
                                        ),
                                      ],
                                    )),
                              ),
                            );
                          },
                        ),
                      ),

                      PrimaryButton(
                          onPressed: () async {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) => const RootPage(),
                                ));
                          },
                          text: "Tekshiruv uchun yuborish")
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<ModelDriverModel> listDriverModel = [
    ModelDriverModel(name: "Паспорт или ID карта", action: "1", note: ""),
    ModelDriverModel(name: "Водительское удостоверение", action: "2", note: ""),
    ModelDriverModel(name: "Выбирите свою компанию", action: "3", note: ""),
    ModelDriverModel(name: "Выбирите форму оплату", action: "4", note: ""),
  ];

  List<String> listCarInfoList = [
    "Выберите транспорт",
    "Свидетельство о регистрации ТС(Тех. паспорт)",
    "Фотография транспорта"
  ];
}

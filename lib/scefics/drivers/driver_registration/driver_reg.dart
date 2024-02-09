import 'package:conx/scefics/drivers/driver_registration/controller_driver_reg.dart';
import 'package:conx/scefics/drivers/driver_registration/driver_choose_company/driver_choose_company.dart';
import 'package:conx/scefics/drivers/driver_registration/driver_license/driver_license.dart';
import 'package:conx/scefics/drivers/driver_registration/driver_license/photo_driver_license.dart';
import 'package:conx/scefics/drivers/driver_registration/model_driver/model_driver_model.dart';
import 'package:conx/scefics/drivers/passport/passport.dart';
import 'package:conx/widgets/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DrawerRegistration extends ConsumerStatefulWidget {
  const DrawerRegistration({super.key});

  @override
  ConsumerState<DrawerRegistration> createState() => _DrawerRegistrationState();
}

class _DrawerRegistrationState extends ConsumerState<DrawerRegistration> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.colorBackground,
        elevation: 0,

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
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
                          color: Colors.white, fontWeight: FontWeight.normal)),
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
                        style: TextStyle(color: AppColors.colorBackground),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.35,
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: listDriverModel.length,
                      itemBuilder: (context, index) {
                        return Card(
                          color: const Color.fromRGBO(241, 242, 240, 1),
                          child: ListTile(
                            onTap: () {
                              switch (listDriverModel[index].action) {
                                case "1":
                                  Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                        builder: (context) => Passport(),
                                      ));
                                case "2":
                                  Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                        builder: (context) => DriverLicense(),
                                      ));
                                case "3":
                                  Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                        builder: (context) => PhotoDiverLicense(),
                                      ));
                                case "4":
                                  Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                        builder: (context) => DriverChooseCompany(),
                                      ));
                              }
                            },
                            title: Text(listDriverModel[index].name),
                            trailing: SizedBox(
                                width: 50,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                      ref.watch(controllerDriverReg).list[index] == "1"?
                                    const Icon(Icons.check_circle_outline, color: AppColors.colorBackground)
                                    :SizedBox.shrink()
                                    ,
                                    const Icon(Icons.arrow_forward_ios),
                                  ],
                                )),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
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
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.28,
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return const Card(
                          color: Color.fromRGBO(241, 242, 240, 1),
                          child: ListTile(
                            title: Text("Паспорт или ID карта"),
                            trailing: Icon(Icons.arrow_forward_ios),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 30),
                  MaterialButton(
                    onPressed: () async {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => const Passport(),
                          ));
                    },
                    height: 50,
                    minWidth: double.infinity,
                    color: AppColors.colorBackground,
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.grey)),
                    child: const Text("Tekshiruv uchun yuborish",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  List<ModelDriverModel> listDriverModel = [
    ModelDriverModel(name: "Паспорт или ID карта", action: "1", note: ""),
    ModelDriverModel(name: "Водительское удостоверение", action: "2", note: ""),
    ModelDriverModel(name: "Выбирите свою компанию", action: "3", note: ""),
    ModelDriverModel(name: "Выбирите форму оплату", action: "4", note: ""),
  ];
}

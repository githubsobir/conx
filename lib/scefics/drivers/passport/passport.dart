import 'dart:developer';

import 'package:conx/scefics/drivers/driver_registration/driver_license/driver_license.dart';
import 'package:conx/widgets/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Passport extends StatefulWidget {
  const Passport({super.key});

  @override
  State<Passport> createState() => _PassportState();
}

class _PassportState extends State<Passport> {
  late final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            height: 50,
            margin: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: MaterialButton(
                    onPressed: () {
                      if (controller.page!.toInt().toString() == "1") {
                        controller.jumpToPage(1); // for regular jump
                        controller
                            .animateToPage(0,
                                curve: Curves.decelerate,
                                duration: const Duration(milliseconds: 300))
                            .then((value) => setState(() {
                                  log("Pasport");
                                  log(controller.page!.toInt().toString());
                                })); // for animated jump. Requires a curve and a duration
                      }
                    },
                    height: 50,
                    // color: controller.page!.toInt().toString() == "0"
                    //     ? AppColors.colorBackground
                    //     : Colors.grey.shade300,
                    shape: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Text(
                      "Pasport",
                      // style: TextStyle(
                      //     color: controller.page!.toInt().toString() == "0"
                      //         ? Colors.white
                      //         : Colors.black),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: MaterialButton(
                    onPressed: () {
                      if (controller.page!.toInt().toString() == "0") {
                        controller.jumpToPage(0); // for regular jump
                        controller
                            .animateToPage(1,
                                curve: Curves.decelerate,
                                duration: const Duration(milliseconds: 300))
                            .then((value) => setState(() {
                                  log("Id Karta");
                                  log(controller.initialPage.toString());
                                })); // for animated jump. Requires a curve and a duration
                      }
                    },
                    height: 50,
                    // color: controller.page!.toInt().toString() == "1"
                    //     ? Colors.grey.shade300
                    //     : AppColors.colorBackground,
                    shape: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Text("ID karta"),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: PageView(
              controller: controller,
              children: [
                passport(),
                idCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget passport() {
    return Container(
      margin: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Pasport",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          const SizedBox(height: 5),
          const Text("Введите здесь свои паспортные данные"),
          const SizedBox(height: 10),
          const Text("Серия и номер"),
          const SizedBox(height: 5),
          SizedBox(
            height: 60,
            child: TextFormField(
              decoration: InputDecoration(
                  fillColor: Colors.grey.shade100,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.grey, width: 1)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.grey, width: 1)),
                  border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.transparent, width: 1),
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            "Фотография документа",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox.shrink(),
              Container(
                height: 104,
                width: MediaQuery.of(context).size.width*0.4,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.photo_camera_outlined),
                      SizedBox(height: 10),
                      Text("Лицевая сторона",  style: TextStyle(fontWeight: FontWeight.w600),)
                    ],
                  ),
                ),
              ),
              Container(
                height: 104,
                width: MediaQuery.of(context).size.width*0.4,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.photo_camera_outlined),
                      SizedBox(height: 10),
                      Text("Обратная сторона",  style: TextStyle(fontWeight: FontWeight.w600),)
                    ],
                  ),
                ),
              ),
              const SizedBox.shrink(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              height: 104,
              width: MediaQuery.of(context).size.width*0.4,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10)),
              child: const Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.photo_camera_outlined),
                    SizedBox(height: 10),
                    Text("Фотография лица на фоне документа", textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
            ),
          ),

          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,

            children: [      MaterialButton(
              onPressed: ()  {

                Navigator.push(context,CupertinoPageRoute(builder: (context) => DriverLicense(),));

              },
              height: 55,
              minWidth: double.infinity,
              color: AppColors.colorBackground,
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.grey)),
              child: const Text("Davom etish 1",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white)),
            ),],

          ))
        ],
      ),
    );
  }

  Widget idCard(){
    return Container(
      margin: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "ID karta",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          const SizedBox(height: 5),
          const Text("Введите здесь свои ID карта данные"),
          const SizedBox(height: 10),
          const Text("Серия и номер"),
          const SizedBox(height: 5),
          SizedBox(
            height: 60,
            child: TextFormField(
              decoration: InputDecoration(
                  fillColor: Colors.grey.shade100,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.grey, width: 1)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.grey, width: 1)),
                  border: OutlineInputBorder(
                      borderSide:
                      const BorderSide(color: Colors.transparent, width: 1),
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            "Фотография документа",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox.shrink(),
              Container(
                height: 104,
                width: MediaQuery.of(context).size.width*0.4,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.photo_camera_outlined),
                      SizedBox(height: 10),
                      Text("Лицевая сторона",  style: TextStyle(fontWeight: FontWeight.w600),)
                    ],
                  ),
                ),
              ),
              Container(
                height: 104,
                width: MediaQuery.of(context).size.width*0.4,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.photo_camera_outlined),
                      SizedBox(height: 10),
                      Text("Обратная сторона",  style: TextStyle(fontWeight: FontWeight.w600),)
                    ],
                  ),
                ),
              ),
              const SizedBox.shrink(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              height: 104,
              width: MediaQuery.of(context).size.width*0.4,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10)),
              child: const Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.photo_camera_outlined),
                    SizedBox(height: 10),
                    Text("Фотография лица на фоне документа", textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
            ),
          ),

          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,

            children: [      MaterialButton(
              onPressed: () async {

              },
              height: 55,
              minWidth: double.infinity,
              color: AppColors.colorBackground,
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.grey)),
              child: const Text("Davom etish",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white)),
            ),],

          ))
        ],
      ),
    );
  }
}

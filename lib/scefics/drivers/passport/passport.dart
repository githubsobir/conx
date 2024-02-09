import 'dart:developer';

import 'package:conx/scefics/drivers/passport/controller_passport.dart';
import 'package:conx/scefics/drivers/passport/widgets/photo_passport1.dart';
import 'package:conx/scefics/drivers/passport/widgets/photo_passport2.dart';
import 'package:conx/scefics/drivers/passport/widgets/photo_passport3.dart';
import 'package:conx/widgets/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Passport extends ConsumerStatefulWidget {
  const Passport({super.key});

  @override
  ConsumerState<Passport> createState() => _PassportState();
}

class _PassportState extends ConsumerState<Passport> {
  late final PageController controller = PageController();
  TextEditingController txtPassport = TextEditingController();

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

                      ref.read(controllerPassport.notifier).setDeafault();

                      if (ref.watch(passportWindowID).toString() == "1") {
                        ref.watch(passportWindowID.notifier).state = 0;
                        controller.jumpToPage(1); // for regular jump
                        controller
                            .animateToPage(0,
                                curve: Curves.decelerate,
                                duration: const Duration(milliseconds: 300))
                            .then((value) => setState(() {
                                  log(controller.page!.toInt().toString());
                                })); // for animated jump. Requires a curve and a duration
                      }
                    },
                    height: 50,
                    color: ref.watch(passportWindowID).toString() == "0"
                        ? AppColors.colorBackground
                        : Colors.grey.shade300,
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
                      if (ref.watch(passportWindowID).toString() == "0") {
                        ref.watch(passportWindowID.notifier).state = 1;
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
                    color: ref.watch(passportWindowID).toString() == "1"
                        ? AppColors.colorBackground
                        : Colors.grey.shade300,
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
              physics: const NeverScrollableScrollPhysics(),
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
      height: MediaQuery.of(context).size.width * 0.9,
      child: SingleChildScrollView(
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
            Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: TextFormField(
                controller: txtPassport,
                decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1)),
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.transparent, width: 1),
                        borderRadius: BorderRadius.circular(10))),
                validator: (value) {
                  if (value.toString().isNotEmpty ||
                      value.toString().length < 5) {
                    return "Ma'lumot kiriting";
                  } else {
                    return "";
                  }
                },
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              "Фотография документа",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox.shrink(),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => PhotoPassport1(),
                        ));
                  },
                  child: ref
                              .watch(controllerPassport)
                                      .list
                              .isNotEmpty &&
                          ref
                              .watch(controllerPassport)
                              .list[0]
                              .path
                              .isNotEmpty
                      ?
                      // Text("")
                      Card(
                          child: Image.file(
                              height: 104,
                              width: MediaQuery.of(context).size.width * 0.4,
                              fit: BoxFit.cover,
                              ref
                                  .watch(controllerPassport)
                                  .list[0]),
                        )
                      : Container(
                          height: 104,
                          width: MediaQuery.of(context).size.width * 0.4,
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(10)),
                          child: ref.watch(controllerPassport).list.isNotEmpty
                              ? Image.file(
                                  ref.watch(controllerPassport).list[0])
                              : const Center(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.photo_camera_outlined),
                                      SizedBox(height: 10),
                                      Text(
                                        "Лицевая сторона",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  ),
                                ),
                        ),
                ),
                GestureDetector(
                  onTap: () {
                    ref.watch(controllerPassport).list.isNotEmpty
                        ? Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => PhotoPassport2(),
                            ))
                        : Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => PhotoPassport1(),
                            ));
                  },
                  child: ref.watch(controllerPassport).list.length > 1
                      ? Image.file(
                          ref.watch(controllerPassport).list[1],
                          height: 104,
                          width: MediaQuery.of(context).size.width * 0.4,
                          fit: BoxFit.cover,
                        )
                      : Container(
                          height: 104,
                          width: MediaQuery.of(context).size.width * 0.4,
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
                                Text(
                                  "Обратная сторона",
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          ),
                        ),
                ),
                const SizedBox.shrink(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: GestureDetector(
                onTap: () {

                  ref.watch(controllerPassport).list.isEmpty
                      ? Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => PhotoPassport1(),
                      ))
                      :  ref.watch(controllerPassport).list.length == 1?

                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => PhotoPassport2(),
                      )) :Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => PhotoPassport3(),
                      )) ;
                },
                child: ref.watch(controllerPassport).list.length > 2
                    ? Image.file(
                        ref.watch(controllerPassport).list[2],
                        height: 104,
                        width: MediaQuery.of(context).size.width * 0.4,
                        fit: BoxFit.cover,
                      )
                    : Container(
                        height: 104,
                        width: MediaQuery.of(context).size.width * 0.4,
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
                              Text(
                                "Фотография лица на фоне документа",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                      ),
              ),
            ),
            const SizedBox(height: 40),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MaterialButton(
                  onPressed: () {
                    ref.read(controllerPassport.notifier).sentServer();
                    log(ref.read(controllerPassport).list.length.toString());
                  },
                  height: 55,
                  minWidth: double.infinity,
                  color: AppColors.colorBackground,
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.grey)),
                  child: const Text("Davom etish 77",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget idCard() {
    return Container(
      margin: const EdgeInsets.all(18),
      height: MediaQuery.of(context).size.width * 0.9,
      child: SingleChildScrollView(
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
            Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: TextFormField(
                controller: txtPassport,
                decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                        const BorderSide(color: Colors.grey, width: 1)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                        const BorderSide(color: Colors.grey, width: 1)),
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.transparent, width: 1),
                        borderRadius: BorderRadius.circular(10))),
                validator: (value) {
                  if (value.toString().isNotEmpty ||
                      value.toString().length < 5) {
                    return "Ma'lumot kiriting";
                  } else {
                    return "";
                  }
                },
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              "Фотография документа",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox.shrink(),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => PhotoPassport1(),
                        ));
                  },
                  child: ref
                      .watch(controllerPassport)
                      .list
                      .isNotEmpty &&
                      ref
                          .watch(controllerPassport)
                          .list[0]
                          .path
                          .isNotEmpty
                      ?
                  // Text("")
                  Card(
                    child: Image.file(
                        height: 104,
                        width: MediaQuery.of(context).size.width * 0.4,
                        fit: BoxFit.cover,
                        ref
                            .watch(controllerPassport)
                            .list[0]),
                  )
                      : Container(
                    height: 104,
                    width: MediaQuery.of(context).size.width * 0.4,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(10)),
                    child: ref.watch(controllerPassport).list.isNotEmpty
                        ? Image.file(
                        ref.watch(controllerPassport).list[0])
                        : const Center(
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.photo_camera_outlined),
                          SizedBox(height: 10),
                          Text(
                            "Лицевая сторона",
                            style: TextStyle(
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    ref.watch(controllerPassport).list.isNotEmpty
                        ? Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => PhotoPassport2(),
                        ))
                        : Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => PhotoPassport1(),
                        ));
                  },
                  child: ref.watch(controllerPassport).list.length > 1
                      ? Image.file(
                    ref.watch(controllerPassport).list[1],
                    height: 104,
                    width: MediaQuery.of(context).size.width * 0.4,
                    fit: BoxFit.cover,
                  )
                      : Container(
                    height: 104,
                    width: MediaQuery.of(context).size.width * 0.4,
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
                          Text(
                            "Обратная сторона",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox.shrink(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: GestureDetector(
                onTap: () {

                  ref.watch(controllerPassport).list.isEmpty
                      ? Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => PhotoPassport1(),
                      ))
                      :  ref.watch(controllerPassport).list.length == 1?

                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => PhotoPassport2(),
                      )) :Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => PhotoPassport3(),
                      )) ;
                },
                child: ref.watch(controllerPassport).list.length > 2
                    ? Image.file(
                  ref.watch(controllerPassport).list[2],
                  height: 104,
                  width: MediaQuery.of(context).size.width * 0.4,
                  fit: BoxFit.cover,
                )
                    : Container(
                  height: 104,
                  width: MediaQuery.of(context).size.width * 0.4,
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
                        Text(
                          "Фотография лица на фоне документа",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MaterialButton(
                  onPressed: () {
                    ref.read(controllerPassport.notifier).sentServer();
                    log(ref.read(controllerPassport).list.length.toString());
                  },
                  height: 55,
                  minWidth: double.infinity,
                  color: AppColors.colorBackground,
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.grey)),
                  child: const Text("Davom etish 77",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

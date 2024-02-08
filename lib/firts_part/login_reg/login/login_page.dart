import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:conx/firts_part/login_reg/login/controller_login.dart';
import 'package:conx/widgets/app_colors.dart';
import 'package:conx/widgets/saved_box.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  TextEditingController textEditingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var box = HiveBoxes();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: bodyBuild());
  }

  Widget bodyBuild() {
    if (ref.watch(controllerLogin).boolGetData) {
      if (ref.watch(controllerLogin).txtError.length < 4) {
        return Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "login".tr(),
                style:
                const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              const SizedBox(height: 10),
              Text(
                "registrationText".tr(),
                style:
                const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                    border: Border.symmetric(
                        horizontal: BorderSide(color: Colors.grey.shade300))),
                child: ListTile(
                  leading: CachedNetworkImage(
                    imageUrl:
                    "https://ae04.alicdn.com/kf/S38c74f65152c4b5cab5fddf3deda6c4ag.jpg",
                    // ref
                    //     .watch(controllerLogin.notifier)
                    //     .listModelCountry[]
                    //     .flagImg
                    //     .toString(),
                    height: 36,
                    width: 36,
                    fit: BoxFit.cover,
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                                Colors.red, BlendMode.colorBurn)),
                      ),
                    ),
                    placeholder: (context, url) =>
                        CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                  title: Text(ref
                      .watch(controllerLogin.notifier)
                      .listModelCountry[ref.watch(selectedIndexLogin)]
                      .name
                      .toString()),
                  trailing: const Icon(Icons.keyboard_arrow_down_outlined),
                  onTap: () {
                    getCountryList();
                  },
                ),
              ),
              Container(
                  height: 100,
                  decoration: const BoxDecoration(
                    // color: Colors.grey.shade50,
                      border: Border.symmetric(
                          horizontal: BorderSide(color: Colors.white))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      Form(
                        key: _formKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: TextFormField(
                          controller: textEditingController,
                          maxLines: 1,
                          maxLength: 9,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^\d+(?:\.\d+)?$')),
                          ],
                          decoration: InputDecoration(
                              counter: const SizedBox.shrink(),
                              border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.transparent, width: 1),
                                  borderRadius: BorderRadius.circular(10)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.transparent, width: 1),
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.transparent, width: 1),
                                  borderRadius: BorderRadius.circular(10)),
                              errorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.transparent, width: 1),
                                  borderRadius: BorderRadius.circular(10)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.transparent, width: 1),
                                  borderRadius: BorderRadius.circular(10)),
                              filled: true,
                              fillColor: Colors.grey.shade50,
                              prefix: Text(
                                "${ref.watch(controllerLogin.notifier).listModelCountry[ref.watch(selectedIndexLogin)].code.toString()} | ",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              )),
                          validator: (value) {
                            if (value.toString().length <= 8) {
                              return "Telefon raqamda xato";
                            } else {
                              return "";
                            }
                          },
                        ),
                      ),
                    ],
                  )),
              const SizedBox(height: 50),
              MaterialButton(
                onPressed: () {
                  if (textEditingController.text.toString().length <= 8) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text("checkInfo".tr()),
                          duration: const Duration(milliseconds: 2200)),
                    );
                  } else {
                    box.userPhone = "+998${textEditingController.text}";

                      log("login bosildi");
                    ref
                        .read(controllerLogin.notifier)
                        .sentForLogin(context: context);
                  }
                },
                height: 55,
                minWidth: double.infinity,
                color: AppColors.colorBackground,
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: AppColors.colorBackground)),
                child: Text("continue".tr(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white)),
              ),
            ],
          ),
        );
      } else {
        return Container(
          margin:const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(ref.watch(controllerLogin).txtError,
                    maxLines: 4, textAlign: TextAlign.center),
              ),
              const SizedBox(height: 35),
              MaterialButton(
                onPressed: () {
                ref.read(controllerLogin.notifier).setDefault();
                },
                height: 55,
                color: AppColors.colorBackground,
                minWidth: 100,
                textColor: Colors.white,
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.transparent)),
                child: Text("tryAgain".tr()),
              )
            ],
          ),
        );
      }
    } else {
      return const Center(child: CupertinoActivityIndicator());
    }
  }


  getCountryList() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.6,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("region".tr(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20)),
              ),
              Expanded(
                  child: ListView.builder(
                    itemCount: ref
                        .watch(controllerLogin.notifier)
                        .listModelCountry
                        .length,
                    itemBuilder: (context, index) => Column(
                      children: [
                        const Divider(),
                        ListTile(
                          onTap: () {
                            ref.read(selectedIndexLogin.notifier).state = index;
                            Navigator.of(context).pop();
                          },
                          leading: CachedNetworkImage(
                            imageUrl: ref
                                .watch(controllerLogin.notifier)
                                .listModelCountry[index]
                                .flagImg
                                .toString(),
                            height: 36,
                            width: 36,
                            fit: BoxFit.cover,
                            errorWidget: (context, url, error) {
                              return const Icon(Icons.language);
                            },
                          ),
                          title: Text(ref
                              .watch(controllerLogin.notifier)
                              .listModelCountry[index]
                              .name
                              .toString()),
                        ),
                      ],
                    ),
                  ))
            ]),
      ),
    );
  }

}

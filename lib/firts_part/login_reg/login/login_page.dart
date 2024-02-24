import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:conx/firts_part/login_reg/login/controller_login.dart';
import 'package:conx/theme/app_colors.dart';
import 'package:conx/widgets/error_page.dart';
import 'package:conx/widgets/saved_box.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:masked_text_field/masked_text_field.dart';

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
                            colorFilter: const ColorFilter.mode(
                                Colors.red, BlendMode.colorBurn)),
                      ),
                    ),
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                  title: Text(ref
                      .read(controllerLogin.notifier)
                      .defaultValCountry
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
                          child: MaskedTextField(
                            mask: ref
                                .watch(controllerLogin.notifier)
                                .defaultValCountryMask,
                            maxLength: 17,
                            keyboardType: TextInputType.number,
                            inputDecoration: const InputDecoration(
                              hintText: "Telefon raqam kiriting",
                            ),
                            textFieldController: textEditingController,
                            onChange: (String value) {
                              ref.read(controllerLogin.notifier).getPhoneCodeByTypeUser(valPhone: value);
                            },
                          )
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
                    box.userPhone = textEditingController.text;

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
                    borderSide:
                        const BorderSide(color: AppColors.colorBackground)),
                child: Text("continue".tr(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white)),
              ),
            ],
          ),
        );
      } else {
        return ErrorPage(textUrl: ref.watch(controllerLogin).message, textError: ref.watch(controllerLogin).txtError, onPressed: (){
          ref.read(controllerLogin.notifier).setDefault();

        });
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
                itemCount:
                    ref.watch(controllerLogin.notifier).listModelCountry.length,
                itemBuilder: (context, index) => Column(
                  children: [
                    const Divider(),
                    ListTile(
                      onTap: () {
                        textEditingController.clear();
                        ref.read(selectedIndexLogin.notifier).state = index;
                        ref.read(controllerLogin.notifier).defaultValCountry =
                            ref
                                .read(controllerLogin.notifier)
                                .listModelCountry[index]
                                .name;

                        ref.read(controllerLogin.notifier).defaultValCountryId =
                            ref
                                .read(controllerLogin.notifier)
                                .listModelCountry[index]
                                .code;

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

import 'package:conx/firts_part/login_reg/enter_page/lang_model/model_lang.dart';
import 'package:conx/firts_part/login_reg/enter_page/user_category/user_category.dart';
import 'package:conx/widgets/app_colors.dart';
import 'package:conx/widgets/saved_box.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChooseLang extends StatefulWidget {
  const ChooseLang({super.key});

  @override
  State<ChooseLang> createState() => _ChooseLangState();
}

class _ChooseLangState extends State<ChooseLang> {
  String indexValForRadio = "O'zbek tili";
  int lastActive = 0;
var box = HiveBoxes();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        // backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 20,
            ),
            child: Image.asset(
              "assets/images/star.png",
              fit: BoxFit.cover,
              height: 40,
            ),
          ),
        ],
        elevation: 0,
      ),

      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
                child: Text(
                  "chooseLang".tr(),
                  style:
                      const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ),
              const SizedBox(height: 25),
              Expanded(
                child: ListView.builder(
                    itemCount: listLanguage.length,
                    itemBuilder: (context, index) => Card(
                          color: const Color.fromRGBO(241, 242, 240, 1),
                          shadowColor: Colors.blue,
                          child: ListTile(
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset(
                                listLanguage[index].imageAssetLink,
                                height: 35,
                                width: 35,
                                fit: BoxFit.cover,
                                alignment: Alignment.topRight,
                              ),
                            ),
                            title: Text(listLanguage[index].langName,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                            trailing: GestureDetector(
                              child: Radio(
                                  value: box.langFulName,
                                  autofocus: false,
                                  groupValue: listLanguage[index].langName,
                                  activeColor: AppColors.colorBackground,
                                  onChanged: (val) {
                                    context.setLocale(Locale(
                                        listLanguage[index].langId1,
                                        listLanguage[index].langId2));
                                    indexValForRadio =
                                        listLanguage[index].langName;
                                    listLanguage[index].boolLang = true;
                                    listLanguage[lastActive].boolLang = false;
                                    lastActive = index;
                                    box.langUser = "1";
                                    box.langFulName =  listLanguage[index].langName;
                                    box.langUserLang = listLanguage[index].langId1;
                                    setState(() {});
                                  }),
                            ),
                            onTap: () {

                              context.setLocale(Locale(
                                  listLanguage[index].langId1,
                                  listLanguage[index].langId2));
                              indexValForRadio = listLanguage[index].langName;
                              listLanguage[index].boolLang = true;
                              listLanguage[lastActive].boolLang = false;
                              lastActive = index;
                              box.langUser = "1";
                              box.langFulName =  listLanguage[index].langName;
                              box.langUserLang = listLanguage[index].langId1;

                              setState(() {});
                            },
                          ),
                        )),
              ),
              const SizedBox(height: 10),
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => UserCategory(),
                      ));
                },
                color: AppColors.colorBackground,
                height: 50,
                minWidth: double.infinity,
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.grey)),
                child: Text(
                  "continue".tr(),
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  List<ModelLanguage> listLanguage = [
    ModelLanguage(
        id: 1,
        langName: "O'zbek tili",
        langId1: "uz",
        langId2: "UZ",
        imageAssetLink: "assets/images/uzb.png",
        boolLang: true,
        note: "note"),
    ModelLanguage(
        id: 2,
        langName: "Kazak dili",
        langId1: "kk",
        langId2: "KK",
        imageAssetLink: "assets/images/kz.png",
        boolLang: false,
        note: "note"),
    ModelLanguage(
        id: 3,
        langName: "Türk Dili",
        langId1: "tr",
        langId2: "TR",
        imageAssetLink: "assets/images/tr.png",
        boolLang: false,
        note: "note"),
    ModelLanguage(
        id: 4,
        langName: "Забони точикй",
        langId1: "ta",
        langId2: "TA",
        imageAssetLink: "assets/images/tj.png",
        boolLang: false,
        note: "note"),
    ModelLanguage(
        id: 5,
        langName: "Русский язык",
        langId1: "ru",
        langId2: "RU",
        imageAssetLink: "assets/images/rus.png",
        boolLang: false,
        note: "note"),
    ModelLanguage(
        id: 6,
        langName: "English language",
        langId1: "en",
        langId2: "EN",
        imageAssetLink: "assets/images/uk.png",
        boolLang: false,
        note: "note"),
  ];
}

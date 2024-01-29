import 'package:conx/firts_part/login_reg/enter_page/lang_model/model_lang.dart';
import 'package:conx/firts_part/login_reg/enter_page/user_category/user_category.dart';
import 'package:conx/widgets/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChooseLang extends StatefulWidget {
  const ChooseLang({super.key});

  @override
  State<ChooseLang> createState() => _ChooseLangState();
}

class _ChooseLangState extends State<ChooseLang> {
  String indexValForRadio = "";
  int lastActive = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 80,
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Icon(
                    Icons.star_purple500,
                    size: 40,
                  )
                ]),
              ),
              Text(
                "chooseLang".tr(),
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: ListView.builder(
                    itemCount: listLanguage.length,
                    itemBuilder: (context, index) => Card(
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
                                  value: indexValForRadio,
                                  autofocus: false,
                                  groupValue: listLanguage[index].langName,
                                  activeColor: AppColors.colorBackground,
                                  onChanged: (val) {
                                    context.setLocale(Locale(
                                        listLanguage[index].langId1,
                                        listLanguage[index].langId2));
                                    indexValForRadio = listLanguage[index].langName;
                                    listLanguage[index].boolLang = true;
                                    listLanguage[lastActive].boolLang = false;
                                    lastActive = index;
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
                              setState(() {});
                            },
                          ),
                        )),
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => UserCategory(),
                      ));
                },
                height: 50,
                minWidth: double.infinity,
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.grey)),
                child: Text("Tasdiqlash"),
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
        langId1: "kz",
        langId2: "KZ",
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
        langId1: "tj",
        langId2: "TJ",
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

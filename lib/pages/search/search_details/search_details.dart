import 'package:conx/pages/search/model_search/model_for_search.dart';
import 'package:conx/pages/search/search_details/controller_search.dart';
import 'package:conx/pages/search/sheets/region_sheet.dart';
import 'package:conx/theme/app_colors.dart';
import 'package:conx/widgets/background_widget.dart';
import 'package:conx/widgets/primary_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchDetails extends ConsumerStatefulWidget {
  const SearchDetails({super.key});

  @override
  ConsumerState<SearchDetails> createState() => _SearchDetailsState();
}

class _SearchDetailsState extends ConsumerState<SearchDetails> {
  ModelOrderList99 m = ModelOrderList99();
  final TextEditingController _txt1 = TextEditingController();
  final TextEditingController _txt2 = TextEditingController();
  final TextEditingController _txt3 = TextEditingController();
  final TextEditingController _txt4 = TextEditingController();
  final TextEditingController _txt5 = TextEditingController();
  final TextEditingController _txt6 = TextEditingController();
  final FocusNode _f1 = FocusNode();
  final FocusNode _f2 = FocusNode();
  final FocusNode _f3 = FocusNode();
  final FocusNode _f4 = FocusNode();
  final FocusNode _f5 = FocusNode();
  final FocusNode _f6 = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        const BackgroundWidget(),
        SafeArea(
            child: Container(
          margin: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 65,
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                          color: AppColors.white100,
                          fontWeight: FontWeight.bold),
                      cursorColor: AppColors.white100,
                      decoration: InputDecoration(
                          counter: const SizedBox.shrink(),
                          prefixIcon: Icon(
                            CupertinoIcons.search,
                            color: AppColors.white100,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35)),
                          fillColor: AppColors.white20,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35)),
                          filled: true),
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.all(5),
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: AppColors.white20, shape: BoxShape.circle),
                      child: Center(
                          child: Icon(
                        CupertinoIcons.xmark,
                        color: AppColors.white100,
                        size: 32,
                      )))
                ],
              ),
              const SizedBox(height: 10),
              Text(
                "FILTER",
                style: TextStyle(
                    color: AppColors.white100,
                    fontSize: 26,
                    fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Expanded(
                    child: MaterialButton(
                        height: 40,
                        color: AppColors.newOrangeColorForIcon,
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6)),
                        onPressed: () {},
                        child: Text(
                          "Voditel",
                          style: TextStyle(color: AppColors.white100),
                        )),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: MaterialButton(
                        height: 40,
                        color: AppColors.black50,
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide(color: AppColors.black50)),
                        onPressed: () {},
                        child: Text(
                          "Logist",
                          style: TextStyle(color: AppColors.white100),
                        )),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Text("Ves kg", style: TextStyle(color: AppColors.white100)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Container(
                          margin: const EdgeInsets.all(3),
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: AppColors.white100)),
                          child: ListTile(
                            onTap: () {
                              _f1.requestFocus();
                            },
                            leading: Container(
                              width: 60,
                              padding: const EdgeInsets.only(left: 10),
                              child: TextFormField(
                                controller: _txt1,
                                focusNode: _f1,
                                maxLines: 1,
                                maxLength: 4,
                                keyboardType: TextInputType.number,
                                style: TextStyle(
                                    color: AppColors.white100,
                                    fontWeight: FontWeight.bold),
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    counter: SizedBox.shrink()),
                              ),
                            ),
                            contentPadding: EdgeInsets.zero,
                            trailing: Icon(
                              Icons.keyboard_arrow_down,
                              color: AppColors.white100,
                            ),
                          ))),
                  const SizedBox(width: 4),
                  Expanded(
                      child: Container(
                          margin: const EdgeInsets.all(3),
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: AppColors.white100)),
                          child: ListTile(
                            onTap: () {
                              _f2.requestFocus();
                            },
                            leading: Container(
                              width: 60,
                              padding: const EdgeInsets.only(left: 10),
                              child: TextFormField(
                                controller: _txt2,
                                focusNode: _f2,
                                maxLines: 1,
                                maxLength: 4,
                                keyboardType: TextInputType.number,
                                style: TextStyle(
                                    color: AppColors.white100,
                                    fontWeight: FontWeight.bold),
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    counter: SizedBox.shrink()),
                              ),
                            ),
                            contentPadding: EdgeInsets.zero,
                            trailing: Icon(
                              Icons.keyboard_arrow_down,
                              color: AppColors.white100,
                            ),
                          ))),
                ],
              ),
              const SizedBox(height: 10),
              Text("OByom", style: TextStyle(color: AppColors.white100)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Container(
                          margin: const EdgeInsets.all(3),
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: AppColors.white100)),
                          child: ListTile(
                            onTap: () {
                              _f3.requestFocus();
                            },
                            leading: Container(
                              width: 60,
                              padding: const EdgeInsets.only(left: 10),
                              child: TextFormField(
                                controller: _txt3,
                                focusNode: _f3,
                                maxLines: 1,
                                maxLength: 4,
                                keyboardType: TextInputType.number,
                                style: TextStyle(
                                    color: AppColors.white100,
                                    fontWeight: FontWeight.bold),
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    counter: SizedBox.shrink()),
                              ),
                            ),
                            contentPadding: EdgeInsets.zero,
                            trailing: Icon(
                              Icons.keyboard_arrow_down,
                              color: AppColors.white100,
                            ),
                          ))),
                  const SizedBox(width: 4),
                  Expanded(
                      child: Container(
                          margin: const EdgeInsets.all(3),
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: AppColors.white100)),
                          child: ListTile(
                            onTap: () {
                              _f4.requestFocus();
                            },
                            leading: Container(
                              width: 60,
                              padding: const EdgeInsets.only(left: 10),
                              child: TextFormField(
                                controller: _txt4,
                                focusNode: _f4,
                                maxLines: 1,
                                maxLength: 4,
                                keyboardType: TextInputType.number,
                                style: TextStyle(
                                    color: AppColors.white100,
                                    fontWeight: FontWeight.bold),
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    counter: SizedBox.shrink()),
                              ),
                            ),
                            contentPadding: EdgeInsets.zero,
                            trailing: Icon(
                              Icons.keyboard_arrow_down,
                              color: AppColors.white100,
                            ),
                          ))),
                ],
              ),
              const SizedBox(height: 10),
              Text("Napravleniya", style: TextStyle(color: AppColors.white100)),
              Container(
                  margin: const EdgeInsets.all(3),
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.white100)),
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Text(ref.watch(controllerSearchDetails.notifier).regionName1,
                      style: TextStyle(color: AppColors.white100),
                    ),
                    onTap: () {
                      ref.read(controllerSearchDetails.notifier).getRegion();
                      setBottomSheetSearch(context: context, id: 1, ref: ref);
                    },
                    trailing: Icon(
                      Icons.keyboard_arrow_down,
                      color: AppColors.white100,
                    ),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.import_export,
                    color: AppColors.white100,
                  ),
                ],
              ),
              Container(
                  margin: const EdgeInsets.all(3),
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.white100)),
                  child: ListTile(
                    leading: Text(ref.watch(controllerSearchDetails.notifier).regionName2,
                    style: TextStyle(color: AppColors.white100),
                    ),
                    onTap: () {
                      setBottomSheetSearch(context: context, id: 2, ref: ref);
                    },
                    contentPadding: EdgeInsets.zero,
                    trailing: Icon(
                      Icons.keyboard_arrow_down,
                      color: AppColors.white100,
                    ),
                  )),
              const SizedBox(height: 15),
              Text("Data", style: TextStyle(color: AppColors.white100)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Container(
                          margin: const EdgeInsets.all(3),
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: AppColors.white100)),
                          child: ListTile(
                            contentPadding: EdgeInsets.zero,
                            trailing: Icon(
                              Icons.keyboard_arrow_down,
                              color: AppColors.white100,
                            ),
                          ))),
                  const SizedBox(width: 4),
                  Expanded(
                      child: Container(
                          margin: const EdgeInsets.all(3),
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: AppColors.white100)),
                          child: ListTile(
                            contentPadding: EdgeInsets.zero,
                            trailing: Icon(
                              Icons.keyboard_arrow_down,
                              color: AppColors.white100,
                            ),
                          ))),
                ],
              ),
              SizedBox(height: 10),
              Text("Tip transport",
                  style: TextStyle(color: AppColors.white100)),
              Container(
                  margin: const EdgeInsets.all(3),
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.white100)),
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    trailing: Icon(
                      Icons.keyboard_arrow_down,
                      color: AppColors.white100,
                    ),
                  )),
              SizedBox(height: 10),
              Text("sena", style: TextStyle(color: AppColors.white100)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Container(
                          margin: const EdgeInsets.all(3),
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: AppColors.white100)),
                          child: ListTile(
                            onTap: () {
                              _f5.requestFocus();
                            },
                            leading: Container(
                              width: 60,
                              padding: const EdgeInsets.only(left: 10),
                              child: TextFormField(
                                controller: _txt5,
                                focusNode: _f5,
                                maxLines: 1,
                                maxLength: 4,
                                keyboardType: TextInputType.number,
                                style: TextStyle(
                                    color: AppColors.white100,
                                    fontWeight: FontWeight.bold),
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    counter: SizedBox.shrink()),
                              ),
                            ),
                            contentPadding: EdgeInsets.zero,
                            trailing: Icon(
                              Icons.keyboard_arrow_down,
                              color: AppColors.white100,
                            ),
                          ))),
                  const SizedBox(width: 4),
                  Expanded(
                      child: Container(
                          margin: const EdgeInsets.all(3),
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: AppColors.white100)),
                          child: ListTile(
                            onTap: () {
                              _f6.requestFocus();
                            },
                            leading: Container(
                              width: 60,
                              padding: const EdgeInsets.only(left: 10),
                              child: TextFormField(
                                controller: _txt6,
                                focusNode: _f6,
                                maxLines: 1,
                                maxLength: 4,
                                keyboardType: TextInputType.number,
                                style: TextStyle(
                                    color: AppColors.white100,
                                    fontWeight: FontWeight.bold),
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    counter: SizedBox.shrink()),
                              ),
                            ),
                            contentPadding: EdgeInsets.zero,
                            trailing: Icon(
                              Icons.keyboard_arrow_down,
                              color: AppColors.white100,
                            ),
                          ))),
                ],
              ),
              const SizedBox(height: 10),
              Text("Tip oplata", style: TextStyle(color: AppColors.white100)),
              Container(
                  margin: const EdgeInsets.all(3),
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.white100)),
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    trailing: Icon(
                      Icons.keyboard_arrow_down,
                      color: AppColors.white100,
                    ),
                  )),
              const SizedBox(height: 20),
              PrimaryButton(
                  text: "Prinimat",
                  onPressed: () {
                    ref.read(controllerSearchDetails.notifier).getData(m1: m);
                  })
            ]),
          ),
        ))
      ]),
    );
  }
}

import 'package:conx/pages/search/model_search/model_for_search.dart';
import 'package:conx/pages/search/search_details/controller_search.dart';
import 'package:conx/theme/app_colors.dart';
import 'package:conx/widgets/background_widget.dart';
import 'package:conx/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConfirmationPage extends ConsumerStatefulWidget {
  const ConfirmationPage({super.key});

  @override
  ConsumerState<ConfirmationPage> createState() => _ConfirmationPageState();
}

class _ConfirmationPageState extends ConsumerState<ConfirmationPage> {
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

                  Center(
                    child: Text(
                      "TASDIQLASH",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: AppColors.white100,
                          fontSize: 26,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 10),
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
                                leading:Text(""),
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
                                leading:Text(""),
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
                                leading:Text(""),
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
                                leading: Text(""),
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
                        leading: Text(""),
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
                        contentPadding: EdgeInsets.zero,
                        leading: Text(""),
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
                                leading: Text(""),
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
                                leading: const Text(""),
                                trailing: Icon(
                                  Icons.keyboard_arrow_down,
                                  color: AppColors.white100,
                                ),
                              ))),
                    ],
                  ),
                 const SizedBox(height: 10),
                  Text("sana", style: TextStyle(color: AppColors.white100)),
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
                                leading:  Text(""),
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
                                leading:  Text(""),
                                contentPadding: EdgeInsets.zero,
                                trailing: Icon(
                                  Icons.keyboard_arrow_down,
                                  color: AppColors.white100,
                                ),
                              ))),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text("Narxi", style: TextStyle(color: AppColors.white100)),
                  Container(
                      margin: const EdgeInsets.all(3),
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColors.white100)),
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: SizedBox(
                          width: 200,
                          child: TextFormField(
                            style: TextStyle(color: AppColors.white100, fontWeight: FontWeight.bold),
                            keyboardType: TextInputType.number,
                            maxLength: 5,
                            maxLines: 1,
                            decoration:const InputDecoration(
                              counter: SizedBox.shrink(),
                              border: InputBorder.none
                            ),
                          ),
                        ),
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

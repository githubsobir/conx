import 'package:conx/theme/app_colors.dart';
import 'package:conx/widgets/background_widget.dart';
import 'package:conx/widgets/primary_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchDetails extends StatefulWidget {
  const SearchDetails({super.key});

  @override
  State<SearchDetails> createState() => _SearchDetailsState();
}

class _SearchDetailsState extends State<SearchDetails> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        const BackgroundWidget(),
        SafeArea(
            child: Container(
          margin: const EdgeInsets.all(20),
          child:
              SingleChildScrollView(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: TextFormField(),
                  ),
                  Container(
                      padding: const EdgeInsets.all(5),
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
                        height: 36,
                        color: AppColors.newOrangeColorForIcon,
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6)),
                        onPressed: () {},
                        child: Text("1")),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: MaterialButton(
                        color: AppColors.newOrangeColorForIcon,
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        onPressed: () {},
                        child: Text("1")),
                  )
                ],
                            ),
                            const SizedBox(height: 20),
                            Text("Ves", style: TextStyle(color: AppColors.white100)),
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
                        trailing: Icon(
                          Icons.keyboard_arrow_down,
                          color: AppColors.white100,
                        ),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.import_export, color: AppColors.white100, ),
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
                        trailing: Icon(
                          Icons.keyboard_arrow_down,
                          color: AppColors.white100,
                        ),
                      )),
                  SizedBox(height: 15),
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
                  Text("Tip transport", style: TextStyle(color: AppColors.white100)),
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
                  const  SizedBox(height: 10),
                  Text("Tip oplata", style: TextStyle(color: AppColors.white100)),
                  Container(
                      margin: const EdgeInsets.all(3),
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      width: MediaQuery.of(context).size.width*0.9,
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
                  PrimaryButton(text: "Prinimat", onPressed: (){})
                  
                          ]),
              ),
        ))
      ]),
    );
  }
}

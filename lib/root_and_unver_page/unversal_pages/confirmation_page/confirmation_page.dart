import 'dart:developer';

import 'package:conx/pages/main/models/model_main.dart';
import 'package:conx/theme/app_colors.dart';
import 'package:conx/widgets/background_widget.dart';
import 'package:conx/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConfirmationPage extends ConsumerStatefulWidget {
  final ModelOrderList modelOrderList;

  const ConfirmationPage({super.key, required this.modelOrderList});

  @override
  ConsumerState<ConfirmationPage> createState() => _ConfirmationPageState();
}

class _ConfirmationPageState extends ConsumerState<ConfirmationPage> {
  final TextEditingController _txt1 = TextEditingController();

  final FocusNode _f1 = FocusNode();

  @override
  void initState() {
    log(widget.modelOrderList.price.toString());
    _txt1.text = widget.modelOrderList.price.toString();
    super.initState();
  }

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
                  "Оформит заказ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColors.white100,
                      fontSize: 26,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              Text("Ves тонн", style: TextStyle(color: AppColors.white100)),
              Container(
                  margin: const EdgeInsets.all(3),
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.white100)),
                  child: ListTile(
                    onTap: () {
                      _f1.requestFocus();
                    },
                    leading: Text(
                      widget.modelOrderList.weight.toString(),
                      style: textStyle(),
                    ),
                    contentPadding: EdgeInsets.zero,
                  )),
              const SizedBox(height: 10),
              Text("OByom", style: TextStyle(color: AppColors.white100)),
              Container(
                  margin: const EdgeInsets.all(3),
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.white100)),
                  child: ListTile(
                    onTap: () {},
                    leading: Text(
                      widget.modelOrderList.volumeM3.toString(),
                      style: textStyle(),
                    ),
                    contentPadding: EdgeInsets.zero,
                  )),
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
                    leading: Text(
                      widget.modelOrderList.locationFrom.name,
                      style: textStyle(),
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
                    leading: Text(
                      widget.modelOrderList.locationTo.name.toString(),
                      style: textStyle(),
                    ),
                  )),
              const SizedBox(height: 15),
              Text("Data", style: TextStyle(color: AppColors.white100)),
              Container(
                  margin: const EdgeInsets.all(3),
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.white100)),
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Text(
                      widget.modelOrderList.date.toString(),
                      style: textStyle(),
                    ),
                  )),
                 const SizedBox(height: 10),
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
                        controller: _txt1,
                        style: TextStyle(
                            color: AppColors.white100,
                            fontWeight: FontWeight.bold),
                        keyboardType: TextInputType.number,
                        maxLength: 5,
                        maxLines: 1,
                        decoration: const InputDecoration(
                            counter: SizedBox.shrink(),
                            border: InputBorder.none),
                      ),
                    ),
                    trailing: Icon(
                      Icons.edit,
                      color: AppColors.white100,
                    )
                        // .animate(
                        // onPlay: (controller) =>
                        //     controller.repeat(reverse: true, period: const Duration(seconds: 4)))
                        // .scaleXY(
                        // end: 1,
                        // delay: const Duration(milliseconds: 1000),
                        // curve: Curves.linear)
                        // .shimmer(
                        // color: AppColors.background,
                        // delay: const Duration(milliseconds: 1000))
                        // .elevation(end: 0),
                  )),
                 const SizedBox(height: 20),
                 PrimaryButton(text: "Принимат", onPressed: () {})
            ]),
          ),
        ))
      ]),
    );
  }

  TextStyle textStyle() {
    return TextStyle(
        fontWeight: FontWeight.bold, color: AppColors.white100, fontSize: 16);
  }
}

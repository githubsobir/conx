import 'package:conx/scefics/drivers/cargo_transport/cargo_transport.dart';
import 'package:conx/scefics/drivers/choose_rate/controller_payment.dart';
import 'package:conx/scefics/drivers/choose_rate/model_payment/model_rate.dart';
import 'package:conx/theme/app_colors.dart';
import 'package:conx/widgets/background_widget.dart';
import 'package:conx/widgets/primary_button.dart';
import 'package:conx/widgets/saved_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChooseRate extends ConsumerStatefulWidget {
  const ChooseRate({super.key});

  @override
  ConsumerState<ChooseRate> createState() => _ChooseRateState();
}

class _ChooseRateState extends ConsumerState<ChooseRate> {
  String val1 = "Наличные";
  int valNum = 0;
  var box = HiveBoxes();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        iconTheme: IconThemeData(color: AppColors.white100),
        elevation: 0,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            const BackgroundWidget(),
            Container(
              margin: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    "Выбирайте удобные для вас способы оплаты",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white100),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.6,
                      child: ListView.builder(
                        itemCount: listModelChooseRate.length,
                        itemBuilder: (context, index) => Card(
                          child: ListTile(
                            title: Text(listModelChooseRate[index].nameRate,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                )),
                            trailing: GestureDetector(
                              child: Radio(
                                  value: listModelChooseRate[index].nameRate,
                                  autofocus: false,
                                  groupValue: val1,
                                  activeColor: AppColors.colorBackground,
                                  onChanged: (val) {
                                    val1 = listModelChooseRate[index].nameRate;
                                    box.payType =
                                        listModelChooseRate[index].nameRate;
                                    valNum = index;
                                    setState(() {});
                                  }),
                            ),
                            onTap: () {
                              valNum = index;
                              val1 = listModelChooseRate[index].nameRate;
                              box.payType = listModelChooseRate[index].nameRate;
                              setState(() {});
                            },
                          ),
                        ),
                      )),
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      PrimaryButton(
                        onPressed: () {
                          ref
                              .read(controllerPayment.notifier)
                              .setData(index: valNum);
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => const CargoTransport(),
                              ));
                        },
                        text: "Davom etish",
                      ),
                    ],
                  ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<ModelChooseRate> listModelChooseRate = [
    ModelChooseRate(
        id: 1,
        nameRate: "Наличные",
        textRate: "Наличные",
        imageAssetLink: "",
        boolActive: true,
        note: "note"),
    ModelChooseRate(
        id: 2,
        nameRate: "Картой",
        textRate: "Картой",
        imageAssetLink: "",
        boolActive: false,
        note: "note"),
    ModelChooseRate(
        id: 3,
        nameRate: "Перечисления",
        textRate: "Перечисления",
        imageAssetLink: "",
        boolActive: false,
        note: "note"),
  ];
}

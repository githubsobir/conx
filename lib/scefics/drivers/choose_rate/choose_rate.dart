import 'package:conx/scefics/drivers/cargo_transport/cargo_transport.dart';
import 'package:conx/scefics/drivers/choose_rate/model_rate.dart';
import 'package:conx/widgets/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChooseRate extends StatefulWidget {
  const ChooseRate({super.key});

  @override
  State<ChooseRate> createState() => _ChooseRateState();
}

class _ChooseRateState extends State<ChooseRate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              const Text(
                "Выбирайте удобные для вас способы оплаты",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: ListView.builder(
                    itemCount: listModelChooseRate.length,
                    itemBuilder: (context, index) => Container(
                        height: 50,
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: listModelChooseRate[index].boolActive
                                ? AppColors.colorBackground
                                : Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 15),
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: Text(listModelChooseRate[index].nameRate,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color:
                                          listModelChooseRate[index].boolActive
                                              ? Colors.white
                                              : Colors.black)),
                            ),
                            Checkbox(
                                splashRadius: 20,
                                checkColor: Colors.white,
                                activeColor: AppColors.colorBackground,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  side: const BorderSide(color: Colors.white),
                                ),
                                side: const BorderSide(
                                    color: Colors.black, width: 1),
                                value: listModelChooseRate[index].boolActive,
                                onChanged: (val) {})
                          ],
                        )),
                  )),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MaterialButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => CargoTransport(),
                          ));
                    },
                    height: 50,
                    minWidth: double.infinity,
                    color: AppColors.colorBackground,
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.grey)),
                    child: const Text("Davom etish",
                        style: TextStyle(color: Colors.white)),
                  ),
                ],
              ))
            ],
          ),
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

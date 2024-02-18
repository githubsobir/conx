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

  String val1 ="Наличные";

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
                    itemBuilder: (context, index) => Card(
                      child: ListTile(

                        title: Text(listModelChooseRate[index].nameRate,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold)),
                        trailing: GestureDetector(
                          child: Radio(
                              value: listModelChooseRate[index].nameRate,
                              autofocus: false,
                              groupValue: val1,
                              activeColor: AppColors.colorBackground,
                              onChanged: (val) {
                                val1 = listModelChooseRate[index].nameRate;
                                setState(() {});
                              }),
                        ),
                        onTap: () {

                          val1 = listModelChooseRate[index].nameRate;
                          setState(() {});
                        },
                      ),
                    ),
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

import 'package:conx/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class UserTimeEnd extends StatefulWidget {
  const UserTimeEnd({super.key});

  @override
  State<UserTimeEnd> createState() => _UserTimeEndState();
}

class _UserTimeEndState extends State<UserTimeEnd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Время окончания тарифа"),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              height: 150,
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Премиум", style: TextStyle(fontSize: 20)),
                  Text("24-день 14:34:12", style: TextStyle(fontSize: 36)),
                ],
              ),
            ),
            SizedBox(height: 20),
            Card(
              child: ListTile(
                title: Text(listValueUserEnd[0],
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: const Text("4.99 \$"),
                trailing: GestureDetector(
                  child: Radio(
                      value: indexListValueUser,
                      autofocus: false,
                      groupValue: listValueUserEnd[0],
                      activeColor: AppColors.colorBackground,
                      onChanged: (val) {
                        indexListValueUser = listValueUserEnd[0];
                        setState(() {});
                      }),
                ),
                onTap: () {
                  indexListValueUser = listValueUserEnd[0];
                  setState(() {});
                },
              ),
            ),
           const SizedBox(height: 10),
            Card(
              child: ListTile(
                title: Text(listValueUserEnd[1],
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text("4.99 \$"),
                trailing: GestureDetector(
                  child: Radio(
                      value: indexListValueUser,
                      autofocus: false,
                      groupValue: listValueUserEnd[1],
                      activeColor: AppColors.colorBackground,
                      onChanged: (val) {
                        indexListValueUser = listValueUserEnd[1];
                        setState(() {});
                      }),
                ),
                onTap: () {
                  indexListValueUser = listValueUserEnd[1];
                  setState(() {});
                },
              ),
            ),
            const SizedBox(height: 10),
            MaterialButton(
              onPressed: () {

              },
              height: 55,
              minWidth: double.infinity,
              color: AppColors.colorBackground,
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                  )),
              child: Text("skip".tr(),
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 20),
          ],
        ),
      )),
    );
  }

  String indexListValueUser = "";
  List<String> listValueUserEnd = ["Ежемесячно", "Ежегодный"];
}

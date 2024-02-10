import 'package:conx/scefics/drivers/tex_car/widgets/photo_tex_car.dart';
import 'package:conx/widgets/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextCarEnterInfo extends StatefulWidget {
  const TextCarEnterInfo({super.key});

  @override
  State<TextCarEnterInfo> createState() => _TextCarEnterInfoState();
}

class _TextCarEnterInfoState extends State<TextCarEnterInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(child:
      Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Какой у машины госномер?", style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30
            ),),

            const SizedBox(height: 20),
            const Text("Страна"),
            const SizedBox(height: 5),
            GestureDetector(
              onTap: () {
                // _selectDate(context);
              },
              child: Container(
                  height: 60,
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      // boolSelected
                      //     ? Text(
                      //     DateFormat('yyyy-MM-dd').format(selectedDate))
                      //     : const SizedBox(),
                    ],
                  )),
            ),
            const SizedBox(height: 10),
            const Text("Гос номер"),
            const SizedBox(height: 5),
            SizedBox(
              height: 60,
              child: TextFormField(
                // controller: textSerNum,
                decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                        const BorderSide(color: Colors.grey, width: 1)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                        const BorderSide(color: Colors.grey, width: 1)),
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.transparent, width: 1),
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            const SizedBox(height: 20),
            const Text("Гос номер прицеп"),
            const SizedBox(height: 5),
            GestureDetector(
              onTap: () {
                // _selectDate(context);
              },
              child: Container(
                  height: 60,
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      // boolSelected
                      //     ? Text(
                      //     DateFormat('yyyy-MM-dd').format(selectedDate))
                      //     : const SizedBox(),
                    ],
                  )),
            ),
            const SizedBox(height: 40),
            MaterialButton(
              onPressed: () {
                Navigator.push(context, CupertinoPageRoute(builder: (context) => PhotoTexCar(),));

              },
              height: 55,
              minWidth: double.infinity,
              color: AppColors.colorBackground,
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.grey)),
              child: const Text("Davom etish",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white)),
            ),
          ],
        ),
      )
      ),
    );
  }
}

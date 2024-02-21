import 'package:conx/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ChoosePlan extends StatefulWidget {
  const ChoosePlan({super.key});

  @override
  State<ChoosePlan> createState() => _ChoosePlabnState();
}

class _ChoosePlabnState extends State<ChoosePlan> {
  bool boolGetActive = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Icon(Icons.arrow_back_ios)),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Icon(Icons.star_rounded)),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              "O'z rejaningni tanla",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            const SizedBox(height: 10),
            Text(
              "Ro'yxatdan o'tish jarayoni yakunlanishi uchun to'lov qilishingiz so'raladi",
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.grey.shade600,
                  fontSize: 18),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                setState(() {
                  boolGetActive = !boolGetActive;
                });
              },
              child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: boolGetActive ? Colors.black : Colors.grey)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Oylik",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "\$4.99",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                                fontSize: 17),
                          ),
                        ],
                      ),
                      Checkbox(
                        value: boolGetActive,
                        onChanged: (val) {},
                        shape: const CircleBorder(),
                        checkColor: AppColors.colorBackground,
                        activeColor: AppColors.colorBackground,
                      )
                    ],
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  boolGetActive = !boolGetActive;
                });
              },
              child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: !boolGetActive ? Colors.black : Colors.grey)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Yillik",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "\$3.99(\$48/yillik)",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                                fontSize: 17),
                          ),
                        ],
                      ),
                      Checkbox(
                        value: !boolGetActive,
                        onChanged: (val) {},
                        shape: const CircleBorder(),
                        checkColor: AppColors.colorBackground,
                        activeColor: AppColors.colorBackground,
                      )
                    ],
                  )),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MaterialButton(
                    onPressed: () {},
                    height: 50,
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.transparent)),
                    color: AppColors.colorBackground,
                    minWidth: double.infinity,
                    child: Text("A'zolikni tasdiqlash", style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                     ),),
                  ),
                  SizedBox(height: 12),
                  MaterialButton(
                    onPressed: () {},
                    height: 50,
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: AppColors.colorBackground)),
                    color: Colors.white,
                    minWidth: double.infinity,
                    child: Text("O'tkazib yuborish", style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color:AppColors.colorBackground,
                    ),),
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}

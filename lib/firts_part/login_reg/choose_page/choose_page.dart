import 'package:conx/firts_part/login_reg/reg/reg.dart';
import 'package:conx/widgets/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChoosePage extends StatefulWidget {
  const ChoosePage({super.key});

  @override
  State<ChoosePage> createState() => _ChoosePageState();
}

class _ChoosePageState extends State<ChoosePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        margin: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      "assets/images/illustration.png",
                      height: MediaQuery.of(context).size.height * 0.6,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      // alignment: Alignment.topCenter,
                    ),
                  ),
                  Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        margin: const EdgeInsets.all(20),
                        padding: const EdgeInsets.all(5),
                        decoration:  BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                            color: const Color.fromRGBO(114, 127, 108, 0.7)),
                        child: const Text("O'tkazish",
                            style: TextStyle(
                              color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ))
                ],
              ),
              const SizedBox(height: 20),
              const Text("Explore the app", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),),
              Container(
                margin: const EdgeInsets.only(bottom: 15, top: 10, right: 22, left: 22),
                child: const Text("Now your finances are in one place and always under control",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 17),),
              ),
              MaterialButton(
                onPressed: () {
          
                },
                height: 50,
                minWidth: double.infinity,
                color: AppColors.colorBackground,
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.grey)),
                child: const Text("Kirish", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
              ),
              const SizedBox(height: 20),
              MaterialButton(
                onPressed: () {
                  Navigator.push(context, CupertinoPageRoute(builder: (context) => Registration(),));
                },
                height: 50,
                minWidth: double.infinity,
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.grey)),
                child: const Text("Registratsiya",style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.colorBackground)),
              ),
            ],
          ),
        ),
      )),
    );
  }
}

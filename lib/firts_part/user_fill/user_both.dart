import 'package:conx/widgets/app_colors.dart';
import 'package:flutter/material.dart';

class UserBoth extends StatefulWidget {
  const UserBoth({super.key});

  @override
  State<UserBoth> createState() => _UserBothState();
}

class _UserBothState extends State<UserBoth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              const Text(
                "Tug'ulgan sanangizni kiriting",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              const SizedBox(height: 30),
              const Text("Sana", style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(
                height: 55,
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                          BorderSide(color: AppColors.colorBackground))),
                ),
              ),
              const SizedBox(height: 30),

              MaterialButton(
                onPressed: () {},
                height: 50,
                minWidth: double.infinity,
                color: AppColors.colorBackground,
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.grey)),
                child: const Text("Davom etish",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white)),
              ),
              Expanded(
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Akkauntingiz bormi? Kirish",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

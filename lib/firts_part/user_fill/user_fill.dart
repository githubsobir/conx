import 'package:conx/firts_part/user_fill/user_both.dart';
import 'package:conx/widgets/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserFIO extends StatefulWidget {
  const UserFIO({super.key});

  @override
  State<UserFIO> createState() => _UserFIOState();
}

class _UserFIOState extends State<UserFIO> {
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
                "Ismingiz, sharifingiz va familiyangizni kiriting",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              const SizedBox(height: 30),
              const Text("Ism", style: TextStyle(fontWeight: FontWeight.bold)),
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
              const SizedBox(height: 20),
              const Text("Familiya",
                  style: TextStyle(fontWeight: FontWeight.bold)),
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
              const SizedBox(height: 20),
              const Text("Sharif",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(
                height: 55,
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              const SizedBox(height: 40),
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => UserBoth(),
                      ));
                },
                height: 50,
                minWidth: double.infinity,
                color: AppColors.colorBackground,
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.grey)),
                child: const Text("Tekshirish",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white)),
              ),
             const Expanded(
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

import 'dart:io';

import 'package:conx/scefics/drivers/choose_direct/choose_directs.dart';
import 'package:conx/widgets/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddPhotoCustomer extends StatefulWidget {
  const AddPhotoCustomer({super.key});

  @override
  State<AddPhotoCustomer> createState() => _AddPhotoCustomerState();
}

class _AddPhotoCustomerState extends State<AddPhotoCustomer> {
  late File _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
          child: Container(
        margin: EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.account_circle,
                color: Colors.grey,
                size: 120,
              ),
              SizedBox(height: 30),
              Text(
                "Rasmingizni kiriting",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MaterialButton(
                    onPressed: () async {
                      final imagePicker = ImagePicker();
                      final pickedImage = await imagePicker.pickImage(
                          source: ImageSource.gallery);

                      if (pickedImage != null) {
                        setState(() {
                          _image = File(pickedImage.path);
                        });
                      }
                    },
                    height: 50,
                    minWidth: double.infinity,
                    color: AppColors.colorBackground,
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.grey)),
                    child: const Text("Rasm qo'shish",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white)),
                  ),
                  SizedBox(height: 20),
                  MaterialButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => const ChooseDirects(),
                          ));
                    },
                    height: 50,
                    minWidth: double.infinity,
                    color: Colors.white,
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.grey)),
                    child: const Text("Keyinroq",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.colorBackground)),
                  ),
                ],
              ))
            ],
          ),
        ),
      )),
    );
  }
}

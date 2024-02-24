import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:conx/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ChatOpen extends StatefulWidget {
  const ChatOpen({super.key});

  @override
  State<ChatOpen> createState() => _ChatOpenState();
}

class _ChatOpenState extends State<ChatOpen> {
  TextEditingController textEditingController = TextEditingController();
  List<String> listChat = [];

  late String val;

  chatUiFunc() async {
    val = textEditingController.text.trim();
    textEditingController.clear();
    setState(() {
      listChat.add(val);
    });

    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      listChat.add("user yozdi: " + val);
    });
  }

  double hText = 60;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.white10,
      appBar: AppBar(
        backgroundColor: AppColors.primaryButton,
        title: Row(
          children: [
            ClipRRect(
              child: CachedNetworkImage(
                  height: 50,
                  imageUrl:
                  "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgyWSD5QQzc6XtglJeSbsBLGXRb07SmRKqShMskHN2ya4NWFqgIBvFldrf-mYAC6G9LB_nxZyLu4r7Ne4LKtY8vaJ4rfJQHwHO2s_D26szkV9M7aR7gfl8YqohdEGTPmDv2dkKziIJff4tjXwmdTadiFMDfF5D8IAlXEtN7izxcdNE5dH6vVD3Eq61-SA/s8000/male.jpg"),
            ),
            SizedBox(width: 20),
            const Text(
              "Chat foydalanuvchisi",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(Icons.add_alert, color: AppColors.white100,),
          )
        ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          /// chat ui

          Expanded(
            child: ListView.builder(
              itemCount: listChat.length,
              itemBuilder: (context, index) => Align(
                alignment: index % 2 == 0
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.4),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(8),
                            topLeft: Radius.circular(8),
                            bottomLeft: Radius.circular(index % 2 == 0 ? 8 : 0),
                            bottomRight:
                                Radius.circular(index % 2 == 0 ? 0 : 8))),
                    child: Text(listChat[index])),
              ),
            ),
          ),

          /// Typing

          Container(
            height: hText,
            width: double.infinity,
            margin: EdgeInsets.all(2),
            decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(5)),
            child: Row(
              children: [

                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Icon(Icons.file_present_outlined,
                  color: Colors.grey.shade600,
                  ),
                ),
                Container(
                  width: w * 0.8,
                  padding: EdgeInsets.all(5),
                  child: TextFormField(

                    maxLines: null,
                    controller: textEditingController,
                    onChanged: (val) {
                      if (val.trim().length > 10) {
                        setState(() {
                          hText = 100;
                        });
                      } else {
                        setState(() {
                          hText = 60;
                        });
                      }
                      log(val);
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      // counter: SizedBox.shrink()
                    ),
                  ),
                ),
                Expanded(
                  child: IconButton(
                      onPressed: () {
                        chatUiFunc();
                      },
                      icon: Icon(
                        Icons.send,
                        color:AppColors.colorBackground
                      )),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}

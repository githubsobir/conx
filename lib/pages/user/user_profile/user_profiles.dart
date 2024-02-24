import 'package:cached_network_image/cached_network_image.dart';
import 'package:conx/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UserProfiles extends StatefulWidget {
  const UserProfiles({super.key});

  @override
  State<UserProfiles> createState() => _UserProfilesState();
}

class _UserProfilesState extends State<UserProfiles> {
  late DateTime selectedDate = DateTime.now();
  bool boolSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white10,
      appBar: AppBar(
        backgroundColor: AppColors.white10,
        title:  Text(
          "Настройки профиля",
          style: TextStyle(color: AppColors.white100),
        ),
        iconTheme:  IconThemeData(color: AppColors.white100),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
          child: Container(
        margin: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Colors.grey.shade400, width: 4),
                        shape: BoxShape.circle),
                    margin: const EdgeInsets.only(right: 20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: CachedNetworkImage(
                        imageUrl:
                            "https://yt3.googleusercontent.com/ytc/AGIKgqPwtgj5FwEJ7cFln7T_qxosKFA-gCZTtaDbRMhCGw=s900-c-k-c0x00ffffff-no-rj",
                        alignment: Alignment.topCenter,
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) =>
                                const CupertinoActivityIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  ),
                  Icon(Icons.photo_camera_outlined, color: AppColors.white100,)
                ],
              ),
              const SizedBox(height: 30),
              Text("Имя", style: TextStyle( color: AppColors.white100,),),
              const SizedBox(height: 10),
              TextFormField(
                maxLines: 1,
                maxLength: 30,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    counter: const SizedBox.shrink(),
                    border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    errorBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    filled: true,
                    fillColor: Colors.white,
                    prefix: Text(
                      "",
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    )),
                validator: (value) {
                  if (value.toString().length <= 8) {
                    return "xato";
                  } else {
                    return "";
                  }
                },
              ),
              Text("Фамилия", style: TextStyle( color: AppColors.white100,),),
              SizedBox(height: 10),
              TextFormField(
                maxLines: 1,
                maxLength: 30,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    counter: const SizedBox.shrink(),
                    border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    errorBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    filled: true,
                    fillColor: Colors.white,
                    prefix: const Text(
                      "",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    )),
                validator: (value) {
                  if (value.toString().length <= 8) {
                    return "xato";
                  } else {
                    return "";
                  }
                },
              ),
              Text("Отчества", style: TextStyle( color: AppColors.white100,),),
              SizedBox(height: 10),
              TextFormField(
                maxLines: 1,
                maxLength: 30,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    counter: const SizedBox.shrink(),
                    border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    errorBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    filled: true,
                    fillColor: Colors.white,
                    prefix: const Text(
                      "",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    )),
                validator: (value) {
                  if (value.toString().length <= 8) {
                    return "xato";
                  } else {
                    return "";
                  }
                },
              ),
              SizedBox(height: 10),
              Text("Дата рождения", style: TextStyle( color: AppColors.white100,),),
              GestureDetector(
                onTap: () {
                  _selectDate(context);
                },
                child: Container(
                    height: 60,
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade50,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey)),
                    child: Row(
                      children: [
                        boolSelected
                            ? Text(
                                DateFormat('yyyy-MM-dd').format(selectedDate))
                            : const SizedBox(),
                      ],
                    )),
              ),
              SizedBox(height: 10),
              Text("Телефон номер", style: TextStyle( color: AppColors.white100,),),
              TextFormField(
                maxLines: 1,
                maxLength: 30,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    counter: const SizedBox.shrink(),
                    border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    errorBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    filled: true,
                    fillColor: Colors.white,
                    prefix: const Text(
                      "",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    )),
                validator: (value) {
                  if (value.toString().length <= 8) {
                    return "xato";
                  } else {
                    return "";
                  }
                },
              ),
              Text("Направление", style: TextStyle( color: AppColors.white100,),),
              Card(
                child: ListTile(
                  title: Text(""),
                  trailing: Icon(
                    Icons.keyboard_arrow_down_sharp,
                    size: 32,
                  ),
                ),
              ),
              SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.import_export, size: 32, color: AppColors.white100,),
                ],
              ),
              Text("Направление", style: TextStyle( color: AppColors.white100,),),
              Card(
                child: ListTile(
                  title: Text(""),
                  trailing: Icon(
                    Icons.keyboard_arrow_down_sharp,
                    size: 32,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text("Комментарий"),
              Container(
                height: 120,
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.white100),
                    borderRadius: BorderRadius.circular(14)),
              ),
              const SizedBox(height: 20),
              MaterialButton(
                onPressed: () {},
                height: 60,
                minWidth: MediaQuery.of(context).size.width * 0.9,
                color: AppColors.primaryButton,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.output),
                      SizedBox(width: 10),
                      Text("Выйти")
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      )),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime picked = await showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 230,
          color: Colors.white,
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  padding: const EdgeInsets.only(right: 20, top: 20),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [Icon(Icons.check)],
                  ),
                ),
              ),
              SizedBox(
                height: 180,
                child: CupertinoDatePicker(
                  initialDateTime: selectedDate,
                  onDateTimeChanged: (DateTime newDate) {
                    setState(() {
                      selectedDate = newDate;
                      boolSelected = true;
                    });
                  },
                  mode: CupertinoDatePickerMode.date,
                  minimumDate: DateTime(2024),
                  maximumDate: DateTime(2030),
                ),
              ),
            ],
          ),
        );
      },
    );

    if (picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
}

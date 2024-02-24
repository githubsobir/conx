import 'package:conx/theme/app_colors.dart';
import 'package:flutter/material.dart';

class Exporter extends StatefulWidget {
  const Exporter({super.key});

  @override
  State<Exporter> createState() => _ExporterState();
}

class _ExporterState extends State<Exporter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white10,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.white100),
      ),
      backgroundColor: AppColors.white10,
      body: SafeArea(
          child: Container(
        margin: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Text(
                "Загрузить фото или видео",
                style: TextStyle(color: AppColors.white100),
              ),
              const SizedBox(height: 5),
              MaterialButton(
                onPressed: () {},
                height: 50,
                minWidth: double.infinity,
                color: AppColors.white20,
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: AppColors.transparent)),
                child: Text(
                  "+ Загрузить",
                  style: TextStyle(color: AppColors.white100),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Название груза",
                style: TextStyle(color: AppColors.white100),
              ),
              const SizedBox(height: 5),
              SizedBox(
                height: 60,
                child: TextFormField(
                  maxLines: 1,
                  decoration: InputDecoration(
                    fillColor: AppColors.white20,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: AppColors.transparent)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: AppColors.transparent)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: AppColors.transparent)),
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: AppColors.transparent)),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Вес",
                style: TextStyle(color: AppColors.white100),
              ),
              const SizedBox(height: 5),
              SizedBox(
                height: 60,
                child: TextFormField(
                  maxLines: 1,
                  decoration: InputDecoration(
                    fillColor: AppColors.white20,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: AppColors.transparent)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: AppColors.transparent)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: AppColors.transparent)),
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: AppColors.transparent)),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Объём м3",
                style: TextStyle(color: AppColors.white100),
              ),
              const SizedBox(height: 5),
              SizedBox(
                height: 60,
                child: TextFormField(
                  maxLines: 1,
                  decoration: InputDecoration(
                    fillColor: AppColors.white20,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: AppColors.transparent)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: AppColors.transparent)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: AppColors.transparent)),
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: AppColors.transparent)),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Направление",
                style: TextStyle(color: AppColors.white100),
              ),
              const SizedBox(height: 5),
              Container(
                height: 56,
                decoration: BoxDecoration(
                    color: AppColors.white20,
                    borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                  trailing: Icon(
                    Icons.keyboard_arrow_down,
                    color: AppColors.white100,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Icon(Icons.import_export, color: AppColors.white100)],
              ),
              const SizedBox(height: 5),
              Container(
                height: 56,
                decoration: BoxDecoration(
                    color: AppColors.white20,
                    borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                  trailing: Icon(
                    Icons.keyboard_arrow_down,
                    color: AppColors.white100,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Тип транспорта",
                style: TextStyle(color: AppColors.white100),
              ),
              const SizedBox(height: 5),
              Container(
                height: 56,
                decoration: BoxDecoration(
                    color: AppColors.white20,
                    borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                  trailing: Icon(
                    Icons.keyboard_arrow_down,
                    color: AppColors.white100,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Срок",
                style: TextStyle(color: AppColors.white100),
              ),
              const SizedBox(height: 5),
              Container(
                height: 56,
                decoration: BoxDecoration(
                    color: AppColors.white20,
                    borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                  trailing: Icon(
                    Icons.calendar_month,
                    color: AppColors.white100,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Цена",
                style: TextStyle(color: AppColors.white100),
              ),
              const SizedBox(height: 5),
              SizedBox(
                height: 60,
                child: TextFormField(
                  maxLines: 1,
                  decoration: InputDecoration(
                    fillColor: AppColors.white20,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: AppColors.transparent)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: AppColors.transparent)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: AppColors.transparent)),
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: AppColors.transparent)),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Тип оплаты",
                style: TextStyle(color: AppColors.white100),
              ),
              const SizedBox(height: 5),
              Container(
                height: 56,
                decoration: BoxDecoration(
                    color: AppColors.white20,
                    borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                  trailing: Icon(
                    Icons.keyboard_arrow_down,
                    color: AppColors.white100,
                  ),
                ),
              ),
             const SizedBox(height: 10),
            Text(
              "Описание",
              style: TextStyle(color: AppColors.white100),
            ),
              Container(
                height: 100,
                decoration: BoxDecoration(
                    color: AppColors.white20,
                    borderRadius: BorderRadius.circular(10)),

              ),
            ],
          ),
        ),
      )),
    );
  }
}

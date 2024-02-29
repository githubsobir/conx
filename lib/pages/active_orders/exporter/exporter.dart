import 'package:conx/pages/active_orders/exporter/controller_exporter.dart';
import 'package:conx/pages/active_orders/exporter/get_images/get_images.dart';
import 'package:conx/pages/active_orders/exporter/get_images/map_picker_page.dart';
import 'package:conx/pages/active_orders/exporter/sheets/region_sheet.dart';
import 'package:conx/pages/active_orders/exporter/sheets/transport_type.dart';
import 'package:conx/pages/active_orders/exporter/sheets/type_cost.dart';
import 'package:conx/theme/app_colors.dart';
import 'package:conx/widgets/background_widget.dart';
import 'package:conx/widgets/primary_button.dart';
import 'package:conx/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class Exporter extends ConsumerStatefulWidget {
  const Exporter({super.key});

  @override
  ConsumerState<Exporter> createState() => _ExporterState();
}

class _ExporterState extends ConsumerState<Exporter> {
  TextEditingController textFormController1 = TextEditingController();
  TextEditingController textFormController2 = TextEditingController();
  TextEditingController textFormController3 = TextEditingController();
  TextEditingController textFormController4 = TextEditingController();
  TextEditingController textFormController5 = TextEditingController();
  TextEditingController textFormController6 = TextEditingController();
  TextEditingController textFormController7 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundWidget(),
          SafeArea(
              child: Container(
            margin: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Создать заказ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.white100,
                            fontSize: 30),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Загрузить фото или видео",
                    style: TextStyle(color: AppColors.white100),
                  ),
                  const SizedBox(height: 5),
                  MaterialButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => GetImagesExporter(),
                          ));
                    },
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
                      controller: textFormController1,
                      maxLines: 1,
                      cursorColor: AppColors.newOrangeColorForIcon,
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                        fillColor: AppColors.white20,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: AppColors.transparent)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: AppColors.transparent)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: AppColors.transparent)),
                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: AppColors.transparent)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Вес тон.",
                    style: TextStyle(color: AppColors.white100),
                  ),
                  const SizedBox(height: 5),
                  SizedBox(
                    height: 60,
                    child: TextFormField(
                      controller: textFormController2,
                      maxLength: 2,
                      maxLines: 1,
                      cursorColor: AppColors.newOrangeColorForIcon,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                        counter: const SizedBox.shrink(),
                        fillColor: AppColors.white20,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: AppColors.transparent)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: AppColors.transparent)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: AppColors.transparent)),
                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: AppColors.transparent)),
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
                      controller: textFormController3,
                      cursorColor: AppColors.newOrangeColorForIcon,
                      keyboardType: TextInputType.number,
                      maxLines: 1,
                      maxLength: 3,
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                        counter: SizedBox.shrink(),
                        fillColor: AppColors.white20,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: AppColors.transparent)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: AppColors.transparent)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: AppColors.transparent)),
                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: AppColors.transparent)),
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
                      onTap: () {
                        getBottomSheet(context: context, id: 1);
                      },
                      leading: ref.watch(controllerExporter).boolGetData
                          ? Text(
                              "${ref.watch(controllerExporter.notifier).region1Name}.  ${ref.watch(controllerExporter.notifier).district1Name}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.white100,
                                  fontSize: 16),
                            )
                          : const Text(""),
                      trailing: Icon(
                        Icons.keyboard_arrow_down,
                        color: AppColors.white100,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.import_export, color: AppColors.white100)
                    ],
                  ),
                  const SizedBox(height: 5),
                  Container(
                    height: 56,
                    decoration: BoxDecoration(
                        color: AppColors.white20,
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      onTap: () {
                        getBottomSheet(context: context, id: 2);
                      },
                      leading: ref.watch(controllerExporter).boolGetData
                          ? Text(
                              "${ref.watch(controllerExporter.notifier).region2Name}.  ${ref.watch(controllerExporter.notifier).district2Name}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.white100,
                                  fontSize: 16),
                            )
                          : const Text(""),
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
                      onTap: () {
                        ref
                            .read(controllerExporter.notifier)
                            .getTransportType();
                        getBottomSheetTransportType(context: context);
                      },
                      leading: ref.watch(controllerExporter).boolGetData
                          ? Text(
                              ref
                                  .watch(controllerExporter.notifier)
                                  .transportName
                                  .toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.white100,
                                  fontSize: 16),
                            )
                          : const Text(""),
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
                      onTap: () {
                        _selectDate(context);
                      },
                      leading: boolSelected
                          ? Text(
                              DateFormat('yyyy-MM-dd').format(selectedDate),
                              style: TextStyle(
                                  fontSize: 16,
                                  color: AppColors.white100,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.bold),
                            )
                          : const SizedBox(),
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
                      controller: textFormController4,
                      cursorColor: AppColors.newOrangeColorForIcon,
                      maxLength: 5,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                      maxLines: 1,
                      decoration: InputDecoration(
                        counter: const SizedBox.shrink(),
                        fillColor: AppColors.white20,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: AppColors.transparent)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: AppColors.transparent)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: AppColors.transparent)),
                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: AppColors.transparent)),
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
                      onTap: () {
                        getBottomSheetTypePayment(context: context);
                      },
                      leading: Text(
                        ref.watch(controllerExporter).boolGetData
                            ? ref.watch(controllerExporter.notifier).costName
                            : "",
                        style: TextStyle(
                          color: AppColors.white100,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: Icon(
                        Icons.keyboard_arrow_down,
                        color: AppColors.white100,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Локатция",
                    style: TextStyle(color: AppColors.white100),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    height: 56,
                    decoration: BoxDecoration(
                        color: AppColors.white20,
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => MapPickerPage(),
                            ));
                      },
                      title: Text(
                        ref.watch(controllerGetPositionSelect)
                            ? "Belgilangan"
                            : "Joylashuvni tanlang",
                        style: TextStyle(color: AppColors.white100),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios_sharp,
                        color: AppColors.white100,
                        size: 18,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Описание",
                    style: TextStyle(color: AppColors.white100),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: AppColors.white20,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                      controller: textFormController5,
                      cursorColor: AppColors.newOrangeColorForIcon,
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                      maxLines: 1,
                      decoration: InputDecoration(
                        fillColor: AppColors.white20,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: AppColors.transparent)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: AppColors.transparent)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: AppColors.transparent)),
                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: AppColors.transparent)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  PrimaryButton(
                      text: "Сохранить",
                      onPressed: () {
                        if (textFormController1.text.isNotEmpty &&
                            textFormController2.text.isNotEmpty &&
                            textFormController3.text.isNotEmpty &&
                            textFormController4.text.isNotEmpty &&
                            textFormController5.text.isNotEmpty &&
                            ref
                                .watch(controllerExporter.notifier)
                                .region1Id
                                .isNotEmpty &&
                            ref
                                .watch(controllerExporter.notifier)
                                .region2Id
                                .isNotEmpty &&
                            ref
                                .watch(controllerExporter.notifier)
                                .transportId
                                .isNotEmpty &&
                            boolSelected &&
                            ref
                                .watch(controllerExporter.notifier)
                                .costName
                                .isNotEmpty &&
                            ref.watch(controllerGetPositionSelect)) {
                          ref.read(controllerExporter.notifier).setOrder(
                              name: textFormController1.text.toString(),
                              weight: textFormController2.text.toString(),
                              volumeM3: textFormController3.text.toString(),
                              locationFrom:  ref
                                  .watch(controllerExporter.notifier)
                                  .district1Id,
                              locationTo:  ref
                                  .watch(controllerExporter.notifier)
                                  .district2Id,
                              transportType:  ref
                                  .watch(controllerExporter.notifier)
                                  .transportId,
                              date: DateFormat('yyyy-MM-dd').format(selectedDate),
                              price: textFormController4.text.toString(),
                              typePayment: ref.watch(controllerExporter.notifier).costName,
                              longitude: ref.watch(controllerGetPositionLat).toString(),
                              latitude: ref.watch(controllerGetPositionLong).toString(),
                              description: textFormController5.text.toString());
                        } else {
                          MyWidgets.snackBarMyWidgets(
                              context: context,
                              text: "Yuqoridagi maydinlarni to'ldiring");
                        }
                      }),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          )),
        ],
      ),
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
                child: CupertinoTheme(
                  data: CupertinoThemeData(
                    brightness: CupertinoTheme.of(context).brightness,
                  ),
                  child: CupertinoDatePicker(
                    initialDateTime:
                        DateTime.now().add(const Duration(days: 7)),
                    onDateTimeChanged: (DateTime newDate) {
                      selectedDate = newDate;
                      boolSelected = true;
                      setState(() {});
                    },
                    mode: CupertinoDatePickerMode.date,
                    minimumDate: DateTime.now(),
                    maximumDate: DateTime.now().add(const Duration(days: 60)),
                  ),
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

  DateTime now = DateTime.now();
  bool boolSelected = false;
  late DateTime selectedDate;
}

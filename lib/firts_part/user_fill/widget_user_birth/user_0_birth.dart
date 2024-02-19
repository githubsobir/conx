// import 'package:conx/firts_part/login_reg/sms/widgets_sms/sms_2_try_again.dart';
// import 'package:conx/firts_part/user_fill/controller_user_birth.dart';
// import 'package:conx/scefics/drivers/driver_registration/driver_reg.dart';
// import 'package:conx/widgets/app_colors.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// late DateTime selectedDate = DateTime.now();
//
// DateTime now = DateTime.now();
//
// bool boolSelected = false;
//
// TextEditingController textEditingController =
// TextEditingController(text: box.userBirth);
//
//
//
// Widget user0BirthDay({required BuildContext context, required WidgetRef ref}) {
//
//   return Container(
//     margin: const EdgeInsets.all(20),
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const SizedBox(height: 30),
//         const Text(
//           "Tug'ulgan sanangizni kiriting",
//           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
//         ),
//         const SizedBox(height: 30),
//         const Text("Sana", style: TextStyle(fontWeight: FontWeight.bold)),
//         SizedBox(
//           height: 55,
//           child: TextFormField(
//             controller: textEditingController,
//             decoration: InputDecoration(
//                 border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide:
//                         const BorderSide(color: AppColors.colorBackground))),
//           ),
//         ),
//         Container(
//             height: 60,
//             width: double.infinity,
//             padding: const EdgeInsets.all(10),
//             decoration: BoxDecoration(
//                 color: Colors.grey.shade200,
//                 borderRadius: BorderRadius.circular(10)),
//             child: Row(
//               children: [
//                 boolSelected
//                     ? Text(
//                     DateFormat('yyyy-MM-dd').format(selectedDate))
//                     : const SizedBox(),
//               ],
//             )),
//         const SizedBox(height: 30),
//         MaterialButton(
//           onPressed: () {
//             ref
//                 .read(userBirthController.notifier).getUserBirth();
//
//             if (box.userBirth.toString().length > 4) {
//               ref
//                   .read(userBirthController.notifier)
//                   .updateUserBirth(date: selectedDate.toString());
//             } else {
//
//               ref
//                   .read(userBirthController.notifier)
//                   .setUserBirth(date: selectedDate.toString());
//             }
//
//             Navigator.push(context,CupertinoPageRoute(builder: (context) => DrawerRegistration(),));
//           },
//           height: 50,
//           minWidth: double.infinity,
//           color: AppColors.colorBackground,
//           shape: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//               borderSide: const BorderSide(color: Colors.grey)),
//           child: const Text("Davom etish",
//               style:
//                   TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
//         ),
//         Expanded(
//             child: Center(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               Text(
//                 "Akkauntingiz bormi? Kirish",
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               )
//             ],
//           ),
//         ))
//       ],
//     ),
//   );
//
// }
//
// Future<void> _selectDate(BuildContext context) async {
//   DateTime picked = await showCupertinoModalPopup(
//     context: context,
//     builder: (BuildContext context) {
//       return Container(
//         height: 230,
//         color: Colors.white,
//         child: Column(
//           children: [
//             GestureDetector(
//               onTap: () {
//                 Navigator.of(context).pop();
//               },
//               child: Container(
//                 padding: const EdgeInsets.only(right: 20, top: 20),
//                 child: const Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [Icon(Icons.check)],
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 180,
//               child: CupertinoDatePicker(
//                 initialDateTime: selectedDate,
//                 onDateTimeChanged: (DateTime newDate) {
//                     selectedDate = newDate;
//                     boolSelected = true;
//                 },
//                 mode: CupertinoDatePickerMode.date,
//                 minimumDate: DateTime(2024),
//                 maximumDate: DateTime(2030),
//               ),
//             ),
//           ],
//         ),
//       );
//     },
//   );
//
//   if (picked != selectedDate) {
//
//       selectedDate = picked;
//   }
// }
import 'dart:io';

import 'package:conx/firts_part/login_reg/reg/add_photo/controller_add_photo_reg.dart';
import 'package:conx/generated/assets.dart';
import 'package:conx/root_and_unver_page/root_page.dart';
import 'package:conx/scefics/drivers/driver_registration/driver_reg.dart';
import 'package:conx/theme/app_colors.dart';
import 'package:conx/widgets/background_widget.dart';
import 'package:conx/widgets/primary_button.dart';
import 'package:conx/widgets/saved_box.dart';
import 'package:conx/widgets/secondary_button.dart';
import 'package:conx/widgets/widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddPhotoRegistration extends ConsumerStatefulWidget {
  const AddPhotoRegistration({super.key});

  @override
  ConsumerState<AddPhotoRegistration> createState() =>
      _AddPhotoRegistrationState();
}

class _AddPhotoRegistrationState extends ConsumerState<AddPhotoRegistration> {
  final _box = HiveBoxes();

  @override
  Widget build(BuildContext context1) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: ref.watch(controllerAddPhotoDriver).statusData == "1"
          ? Stack(
              children: [
                const BackgroundWidget(),
                Container(
                  margin: const EdgeInsets.all(20),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 36,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.of(context1).pop();
                                },
                                icon: Icon(
                                  Platform.isIOS
                                      ? Icons.arrow_back_ios
                                      : Icons.arrow_back,
                                  color: AppColors.white100,
                                )),
                            IconButton(
                                onPressed: () {
                                  ref
                                          .watch(
                                              controllerAddPhotoDriver.notifier)
                                          .imageList
                                          .isEmpty
                                      ? {
                                          MyWidgets.snackBarMyWidgets(
                                              context: context,
                                              text: "Rasm tanlang")
                                        }
                                      : {
                                          ref
                                              .read(controllerAddPhotoDriver
                                                  .notifier)
                                              .setImageServer(context: context1)
                                        };
                                },
                                icon: Icon(
                                  Icons.check_box_outlined,
                                  size: 32,
                                  color: AppColors.newOrangeColorForIcon,
                                )),
                          ],
                        ),
                        SizedBox(
                          height: 250,
                          width: MediaQuery.of(context).size.width,
                          child: Stack(
                            children: [
                              Container(
                                margin: const EdgeInsets.all(30),
                                padding: const EdgeInsets.all(10),
                                alignment: Alignment.center,
                                child: getImage() == "0"
                                    ? SvgPicture.asset(
                                        Assets.iconsIcProfile,
                                        width: 120,
                                        height: 120,
                                      )
                                    : ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        child: Image.file(
                                            height: 180,
                                            width: 180,
                                            fit: BoxFit.cover,
                                            alignment: Alignment.center,
                                            ref
                                                .watch(
                                                  controllerAddPhotoDriver
                                                      .notifier,
                                                )
                                                .imageList[0])),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: IconButton(
                                      onPressed: () {
                                        ref
                                            .read(controllerAddPhotoDriver
                                                .notifier)
                                            .getImageFromGallery();
                                      },
                                      icon: Icon(
                                        Icons.change_circle_outlined,
                                        color: AppColors.white100,
                                      ),
                                    )),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text("Rasmingizni kiriting",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w700,
                                fontSize: 30,
                                color: AppColors.white100)),
                        const Spacer(),
                        PrimaryButton(
                          text: "Rasm tanlash",
                          onPressed: () {
                            setState(() {
                              ref
                                  .read(controllerAddPhotoDriver.notifier)
                                  .getImageFromGallery();
                            });
                          },
                        ),
                        const SizedBox(height: 12),
                        SecondaryButton(
                          text: "skip".tr(),
                          onPressed: () {
                            if (_box.userType.toString() == "2") {
                              Navigator.push(
                                  context,
                                  CupertinoDialogRoute(
                                      builder: (context) => const RootPage(),
                                      context: context));
                            } else {
                              Navigator.push(
                                  context,
                                  CupertinoDialogRoute(
                                      builder: (context) =>
                                          const DrawerRegistration(),
                                      context: context));
                            }
                          },
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          : const Center(child: CupertinoActivityIndicator()),
    );
  }

  String getImage() {
    try {
      return ref
                  .watch(controllerAddPhotoDriver.notifier)
                  .imageList[0]
                  .path
                  .length >
              10
          ? "1"
          : "0";
    } catch (e) {
      return "0";
    }
  }
}

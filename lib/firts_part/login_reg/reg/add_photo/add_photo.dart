import 'package:conx/firts_part/login_reg/reg/add_photo/controller_add_photo_reg.dart';
import 'package:conx/generated/assets.dart';
import 'package:conx/scefics/drivers/driver_registration/driver_reg.dart';
import 'package:conx/theme/app_colors.dart';
import 'package:conx/widgets/primary_button.dart';
import 'package:conx/widgets/secondary_button.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      /*appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey.shade900,
        actions: [
          Visibility(
              visible: getImage() == "0" ? false : true,
              child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: IconButton(
                      onPressed: () {
                        ref
                            .read(controllerAddPhotoDriver.notifier)
                            .setImageServer(context: context);
                      },
                      icon: const Icon(
                        Icons.check,
                        color: Colors.white,
                      )))),
        ],
      ),*/
      body: ref.watch(controllerAddPhotoDriver).statusData == "1"
          ? Stack(
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Image.asset(Assets.imagesBackground)),
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
                        Align(
                          alignment: Alignment.centerLeft,
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.navigate_before,
                                color: AppColors.white100,
                              )),
                        ),
                        Container(
                          margin: const EdgeInsets.all(30),
                          padding: const EdgeInsets.all(10),
                          child: getImage() == "0"
                              ? SvgPicture.asset(
                                  Assets.iconsIcProfile,
                                  width: 120,
                                  height: 120,
                                )
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.file(
                                      height: 180,
                                      width: 180,
                                      fit: BoxFit.fill,
                                      ref
                                          .watch(
                                            controllerAddPhotoDriver.notifier,
                                          )
                                          .imageList[0])),
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
                            Navigator.push(
                                context,
                                CupertinoDialogRoute(
                                    builder: (context) =>
                                        const DrawerRegistration(),
                                    context: context));
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

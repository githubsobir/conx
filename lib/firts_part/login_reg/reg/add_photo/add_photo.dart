import 'package:conx/firts_part/login_reg/reg/add_photo/controller_add_photo_reg.dart';
import 'package:conx/scefics/drivers/driver_registration/driver_reg.dart';
import 'package:conx/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPhotoRegistration extends ConsumerStatefulWidget {
  const AddPhotoRegistration({super.key});

  @override
  ConsumerState<AddPhotoRegistration> createState() => _AddPhotoRegistrationState();
}

class _AddPhotoRegistrationState extends ConsumerState<AddPhotoRegistration> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey.shade900,
        actions: [
          Visibility(
              visible:getImage() =="0"?false:true ,
              child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: IconButton(onPressed: (){
                ref.read(controllerAddPhotoDriver.notifier).setImageServer(context: context);

              }, icon: const Icon(Icons.check, color: Colors.white,)))),
        ],
      ),
      body:
      ref.watch(controllerAddPhotoDriver).statusData == "1"?
      SafeArea(
          child: Container(
        margin: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Container(
                margin: const EdgeInsets.all(30),
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                    color: Colors.grey, shape: BoxShape.circle),
                child:
                getImage() =="0"?
               const Icon(Icons.account_circle,size: 100)
                    :ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.file(
                        height: 180,
                        width: 180,
                        fit: BoxFit.fill,
                        ref.watch(controllerAddPhotoDriver.notifier,

                        ).imageList[0])),
              ),
              const SizedBox(height: 20),
             const Text("Rasmingizni kiriting",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.grey)),
              const SizedBox(height: 20),
              MaterialButton(onPressed: (){
                setState(() {
                  ref.read(controllerAddPhotoDriver.notifier).getImageFromGallery();
                });
              },
                height: 50,
                minWidth: double.infinity,
                color: AppColors.colorBackground,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: Text("Rasm tanlash"),

              ),
              const SizedBox(height: 20),
              MaterialButton(onPressed: (){
                Navigator.push(context, CupertinoDialogRoute(builder: (context) => DrawerRegistration(), context: context));
              },
                height: 50,
                minWidth: double.infinity,
                color: AppColors.colorBackground,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: Text("O'tkazib yuborish"),

              )
            ],
          ),
        ),
      ))
      :Center(child: CupertinoActivityIndicator())
      ,
    );
  }



  String getImage(){
    try{
     return ref.watch(controllerAddPhotoDriver.notifier).imageList[0].path.length > 10?
          "1":"0";
    }catch(e){
      return "0";
    }
  }
}

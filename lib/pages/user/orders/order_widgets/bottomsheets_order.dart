import 'package:cached_network_image/cached_network_image.dart';
import 'package:conx/generated/assets.dart';
import 'package:conx/pages/active_orders/exporter/controller_exporter.dart';
import 'package:conx/theme/app_colors.dart';
import 'package:conx/widgets/primary_button.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_rating_null_safe/flutter_rating_null_safe.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

getOrderBottomSheet(
    {required BuildContext context, required int id, required WidgetRef ref}) {
  showModalBottomSheet(
      context: context,
      enableDrag: true,
      barrierColor: AppColors.white50,
      isScrollControlled: true,
      builder: (context) => Padding(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom),
          child:
         Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(14)),
            height: MediaQuery.of(context).size.height * 0.8,
            child: UserBottomSheetComment(
              idWindow: id,
            )))
      );
}

class UserBottomSheetComment extends ConsumerStatefulWidget {
  int idWindow;

  UserBottomSheetComment({super.key, required this.idWindow});

  @override
  ConsumerState<UserBottomSheetComment> createState() =>
      _UserBottomSheetState();
}

class _UserBottomSheetState extends ConsumerState<UserBottomSheetComment> {
  double ratingBall = 3.5;
  TextEditingController textEditControllerCommit = TextEditingController();
  int index = -1;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          image: DecorationImage(
              image: AssetImage("assets/images/road2.png"), fit: BoxFit.fill)),
      child: Container(
        margin: EdgeInsets.all(10),
        child: SingleChildScrollView(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Оцените",
                      style: TextStyle(
                          color: AppColors.white100,
                          fontSize: 30,
                          fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                ],
              ),
             const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.grey.shade400, width: 4),
                        shape: BoxShape.circle),
                    margin: const EdgeInsets.only(right: 20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: CachedNetworkImage(
                        imageUrl:
                        "https://freepngimg.com/thumb/businessman/163132-businessman-animated-office-free-hq-image.png",
                        alignment: Alignment.topCenter,
                        width: 55,
                        height: 55,
                        fit: BoxFit.cover,
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) =>
                         CupertinoActivityIndicator(
                          color: AppColors.white100,
                        ),
                        errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                      ),
                    ),
                  ),
                  Text("+ 1000", style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.newOrangeColorForIcon, fontSize: 30),)

                ],
              ),
              FlutterRating(
                rating: ratingBall,
                starCount: 5,
                borderColor: Colors.grey,
                color: Colors.amber,
                allowHalfRating: true,
                size: 50,
                mainAxisAlignment: MainAxisAlignment.center,
                onRatingChanged: (rating) {
                  print(rating);
                  ratingBall = rating;
                  setState(() {});
                },
              ),
              SizedBox(height:20),
              Container(
                  height: 56,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: AssetImage(Assets.imagesRoad),
                          fit: BoxFit.cover)),
                  child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Ваш груз хорошо доставили",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: AppColors.white100),
                        textAlign: TextAlign.start,
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: (){
                           index = 1;
                           setState(() {

                           });
                            },
                            child: Container(
                              width: 45,
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: AppColors.black50,
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Text("Yes",
                                style: TextStyle(color:
                                index == 1?AppColors.newOrangeColorForIcon:
                                AppColors.white100), textAlign: TextAlign.center,),
          
          
                            ),
                          ),
                          const SizedBox(width:10),
                          GestureDetector(
                            onTap: (){
                              index = 2;
                              setState(() {

                              });
                            },
                            child: Container(
                              width: 45,
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: AppColors.black50,
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Text("No",
                                style: TextStyle(color:
                                index == 2?AppColors.newOrangeColorForIcon:
                                AppColors.white100), textAlign: TextAlign.center,),
          
          
                            ),
                          ),
                        ],
                      )
          
                    ],
                  ))),
             const SizedBox(height:20),
              Text("Comment",
                style: TextStyle(
                    color: AppColors.white100,
                    fontWeight: FontWeight.w500),),
              Container(
                  height: 100,
                  padding: const EdgeInsets.only(left: 5),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                          image: AssetImage(Assets.imagesRoad),
                          fit: BoxFit.cover)),
                  child:

                  TextFormField(
                    controller: textEditControllerCommit,
                    maxLength: 300,
                    expands: true,
                    maxLines: null,
                    style: TextStyle(color: AppColors.white100, fontWeight: FontWeight.w500),
                    decoration: InputDecoration(
                      counter: SizedBox.shrink(),
                      hintText: "Yozing",
                        hintStyle: TextStyle(color: AppColors.white100),
                        border: InputBorder.none
                    ),

                  ),
                ),
              const SizedBox(height: 20),
              PrimaryButton2(text: "Tasdiqlash", onPressed: (){})
          
            ],
          ),
        ),
      ),
    );
  }
}

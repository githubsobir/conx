import 'package:cached_network_image/cached_network_image.dart';
import 'package:conx/pages/chat/chat_open/chat_open.dart';
import 'package:conx/pages/chat/controller_chat.dart';
import 'package:conx/theme/app_colors.dart';
import 'package:conx/widgets/background_widget.dart';
import 'package:conx/widgets/error_page.dart';
import 'package:conx/widgets/login_or_reg.dart';
import 'package:conx/widgets/saved_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Chat extends ConsumerStatefulWidget {
  const Chat({super.key});

  @override
  ConsumerState<Chat> createState() => _ChatState();
}

class _ChatState extends ConsumerState<Chat> {
  final List<String> imageUrls = [
    'https://fruitgrowersnews.com/wp-content/uploads/2018/07/California-strawberries.jpg',
    "https://avatars.mds.yandex.net/i?id=eaa9ce5c3caa2776986b9acba8e1e3922431db63-9293412-images-thumbs&n=13",
    'https://avatars.mds.yandex.net/i?id=0c901e94b959453fd5ee0ed4b4d5bb42-5225319-images-thumbs&n=13',
    'https://img.promportal.su/foto/good_fotos/2527/25274616/prodam-molodoy-kartofel-optom-v-krasnodarskom-krae_foto_largest.jpg',
    'https://fruitgrowersnews.com/wp-content/uploads/2018/07/California-strawberries.jpg',
    "https://avatars.mds.yandex.net/i?id=eaa9ce5c3caa2776986b9acba8e1e3922431db63-9293412-images-thumbs&n=13",
    'https://avatars.mds.yandex.net/i?id=0c901e94b959453fd5ee0ed4b4d5bb42-5225319-images-thumbs&n=13',
    'https://img.promportal.su/foto/good_fotos/2527/25274616/prodam-molodoy-kartofel-optom-v-krasnodarskom-krae_foto_largest.jpg',
    'https://fruitgrowersnews.com/wp-content/uploads/2018/07/California-strawberries.jpg',
    "https://avatars.mds.yandex.net/i?id=eaa9ce5c3caa2776986b9acba8e1e3922431db63-9293412-images-thumbs&n=13",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(


        appBar: AppBar(
          backgroundColor: AppColors.background,
          elevation: 0,
          centerTitle: true,

          title:  Text("Chat", style: TextStyle(color: AppColors.white100),),
          actions:  [ Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(
              Icons.add_alert,
              color: AppColors.white100,
            ),
          )],
        ),
        body: Stack(
          children: [
            const BackgroundWidget(),
            buildBody(),
          ],
        ));
  }

  var box = HiveBoxes();
  Widget buildBody() {
    return ref.watch(controllerChatList).boolGetData
        ? ref.watch(controllerChatList).errorMessage.toString().length > 4
            ?
    box.userToken.length > 20?
    ErrorPage(
                textUrl: ref.watch(controllerChatList).message,
                textError: ref.watch(controllerChatList).errorMessage,
                onPressed: () {
                  ref.read(controllerChatList.notifier).getData();
                }):LoginOrRegistration()
            : Container(
                margin: const EdgeInsets.all(20),
                child:
                ref.watch(controllerChatList.notifier).lisChat.isEmpty?
                    Center(child: Text("Chat bo'sh", style: TextStyle(color: AppColors.white100),),)
                    :
                Column(
                  children: [
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide:
                                  const BorderSide(color: Colors.transparent)),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide:
                                  const BorderSide(color: Colors.transparent)),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(30)),
                          hoverColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide:
                                  BorderSide(color: Colors.grey.shade200)),
                          fillColor: Colors.grey.shade300,
                          filled: true),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                        child: ListView.builder(
                      itemCount:
                          ref.watch(controllerChatList.notifier).lisChat.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) => ChatOpen(),
                                ));
                          },
                          child: Container(
                            margin: const EdgeInsets.only(top: 5, bottom: 5),
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                color: AppColors.white10,
                                borderRadius: BorderRadius.circular(5)),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: const EdgeInsets.fromLTRB(3, 3, 4, 3),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: CachedNetworkImage(
                                      height: 60,
                                      width: 70,
                                      alignment: Alignment.topCenter,
                                      fit: BoxFit.cover,
                                      imageUrl: ref
                                          .watch(controllerChatList.notifier)
                                          .lisChat[index]
                                          .userInfo
                                          .avatar,
                                    ),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      ref
                                          .watch(controllerChatList.notifier)
                                          .lisChat[index]
                                          .userInfo
                                          .name,
                                      style:  TextStyle(
                                        color: AppColors.white100,
                                      ),
                                    ),
                                    // const SizedBox(height: 3),
                                    // const Text(
                                    //   "Maxsulotlar nomi",
                                    //   style: TextStyle(
                                    //     fontWeight: FontWeight.bold,
                                    //     color: AppColors.white100,
                                    //   ),
                                    // ),
                                    // const SizedBox(height: 3),
                                    // Text(
                                    //   "Chatdagi oxirgi yozilgan xabar",
                                    //   style: TextStyle(
                                    //     color: AppColors.white100,
                                    //   ),
                                    // ),
                                  ],
                                ),
                                SizedBox.shrink(),
                                SizedBox.shrink(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    const SizedBox(height: 3),
                                    const Text(
                                      "18:10",
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          color: Colors.grey),
                                    ),
                                    const SizedBox(height: 3),
                                    Container(
                                      child: Text(
                                        (index + 1).toString(),
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.grey,
                                      ),
                                      padding: const EdgeInsets.all(5),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ))
                  ],
                ))
        : const Center(
            child: CupertinoActivityIndicator(),
          );
  }
}

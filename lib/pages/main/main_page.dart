import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:conx/pages/main/body_main.dart';
import 'package:conx/pages/main/header_main.dart';
import 'package:conx/pages/user/users.dart';
import 'package:conx/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  ConsumerState<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage>
    with TickerProviderStateMixin {
  ScrollController _scrollController = ScrollController();
  late AnimationController _hideFabAnimation;

  @override
  initState() {
    _scrollController = ScrollController(initialScrollOffset: 5.0)
      ..addListener(_scrollListener);
    _hideFabAnimation =
        AnimationController(vsync: this, duration: kThemeAnimationDuration);

    super.initState();
  }

  // late ModelSearch modelSearch;
  var pageCount = 1;

  _scrollListener() async {
    log("countList".toString());
    log(_scrollController.position.pixels.toString());

    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      try {
        // modelSearch = ModelSearch(page: pageCount + 1);

        countList = countList + 10;
        await Future.delayed(const Duration(seconds: 1));
        setState(() {});

        log(countList.toString());
      } catch (e) {
        log(e.toString());
      }
    } else {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _hideFabAnimation.dispose();
    super.dispose();
  }

  int countList = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade900,
          leading: Container(
            width: 50,
            height: 50,
            margin: const EdgeInsets.all(10),
            decoration: const BoxDecoration(boxShadow: [
              BoxShadow(color: Colors.grey, blurRadius: 1, spreadRadius: 1)
            ], shape: BoxShape.circle, color: Colors.grey),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => Users(),
                      ));
                },
                child: CachedNetworkImage(
                  imageUrl:
                      "https://yt3.googleusercontent.com/ytc/AGIKgqPwtgj5FwEJ7cFln7T_qxosKFA-gCZTtaDbRMhCGw=s900-c-k-c0x00ffffff-no-rj",
                  alignment: Alignment.topCenter,
                  width: 50,
                  height: 55,
                  fit: BoxFit.cover,

                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      const CupertinoActivityIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          ),
          title: const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Ruziyev Abduraxmon",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.grey)),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.yellow),
                  Text(
                    "4.95",
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  )
                ],
              ),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.fromLTRB(1, 1, 20, 5),
              child: Container(
                padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                decoration: BoxDecoration(
                    color: Colors.grey.shade200, shape: BoxShape.circle),
                child: Center(
                    child: Icon(
                  CupertinoIcons.bell,
                  color: Colors.grey.shade700,
                )),
              ),
            )
          ],
        ),
        //
        body: SafeArea(
            child: ListView(
          controller: _scrollController,
          children: [
            const SizedBox(height: 522, child: HeaderMain()),
            ConstrainedBox(
              constraints: const BoxConstraints(
                minHeight: 400,
                maxHeight: double.infinity,
              ),
              child: ListView.builder(
                itemCount: countList + 1,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => index < countList
                    ? const SizedBox(height: 520, child: BodyMain())
                    : const SizedBox(
                        height: 100,
                        child: Center(child: CupertinoActivityIndicator()),
                      ),
              ),
            )
          ],
        )),
        floatingActionButton: Visibility(
            visible: countList > 10 && _scrollController.position.pixels > 1000,
            child: GestureDetector(
              onTap: () {
                _scrollController.animateTo(
                  0.0,
                  curve: Curves.easeOut,
                  duration: const Duration(milliseconds: 510),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.colorBackground,
                ),
                child: const Icon(Icons.keyboard_arrow_up, color: Colors.white),
              ),
            )));
  }
}

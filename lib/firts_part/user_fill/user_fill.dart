import 'package:conx/firts_part/user_fill/controller_user.dart';
import 'package:conx/firts_part/user_fill/widgets_user_fill/user_0_main.dart';
import 'package:conx/firts_part/user_fill/widgets_user_fill/user_1_loading.dart';
import 'package:conx/firts_part/user_fill/widgets_user_fill/user_2_error.dart';
import 'package:conx/widgets/saved_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserFIO extends ConsumerStatefulWidget {
  var box = HiveBoxes();

  UserFIO({super.key}) {
    print(box.userToken.toString());
  }

  @override
  ConsumerState<UserFIO> createState() => _UserFIOState();
}

class _UserFIOState extends ConsumerState<UserFIO> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Image.asset("assets/images/star.png"),
          )
        ],
        elevation: 0,
      ),
      body: SafeArea(child: buildBody()),
    );
  }

  Widget buildBody() {
    if (ref.watch(userController).success) {
      return user0Main(context: context);
    } else if (!ref.watch(userController).success) {
      return userLoading();
    } else if (ref.watch(userController).success &&
        ref.watch(userController).errorMessage.length > 10) {
      return user2Error();
    } else {
      return const Center(
        child: Text("default"),
      );
    }
  }
}

import 'package:conx/firts_part/user_fill/controller_user_birth.dart';
import 'package:conx/firts_part/user_fill/widget_user_birth/user_0_birth.dart';
import 'package:conx/firts_part/user_fill/widget_user_birth/user_1_birth_loading.dart';
import 'package:conx/firts_part/user_fill/widget_user_birth/user_birth_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserBoth extends ConsumerStatefulWidget {
  const UserBoth({super.key});

  @override
  ConsumerState<UserBoth> createState() => _UserBothState();
}

class _UserBothState extends ConsumerState<UserBoth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(child: buildBody()),
    );
  }

  Widget buildBody() {
    if (ref.watch(userBirthController).success) {
      return user0BirthDay(context: context, ref: ref);
    } else if (!ref.watch(userBirthController).success) {
      return user1BirthLoading();
    } else if (ref.watch(userBirthController).success &&
        ref.watch(userBirthController).errorMessage.length > 10) {
      return user2BirthError();
    } else {
      return const Center(
        child: Text("default"),
      );
    }
  }
}

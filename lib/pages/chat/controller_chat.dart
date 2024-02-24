import 'package:conx/pages/chat/model_chat/model_chat_controller.dart';
import 'package:conx/pages/chat/model_chat/model_chat_list.dart';
import 'package:conx/widgets/main_url.dart';
import 'package:conx/widgets/saved_box.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final controllerChatList =
    StateNotifierProvider<ControllerChatUser, ModelChatController>(
        (ref) => ControllerChatUser());

class ControllerChatUser extends StateNotifier<ModelChatController> {
  ControllerChatUser()
      : super(ModelChatController(
            boolGetData: true, errorMessage: "", message: "")){getData();}

  var box = HiveBoxes();
  var dio = Dio();
  List<ModelChatList> lisChat = [];

  Future getData() async {
    try {
      state =
          state.copyWith(boolGetData1: false, message1: "", errorMessage1: "");
      Response response = await dio.get(
          "${MainUrl.urlMain}/api/auth/chat-list/",
          options:
              Options(headers: {"Authorization": "Bearer ${box.userToken}"}));
      lisChat =
          (response.data as List).map((e) => ModelChatList.fromJson(e)).toList();
      state =
          state.copyWith(boolGetData1: true, message1: "", errorMessage1: "");
    } on DioException catch (ee) {
      state = state.copyWith(boolGetData1: true, message1: "/api/auth/chat-list/", errorMessage1: ee.toString());
    } catch (e) {
      state = state.copyWith(boolGetData1: true, message1:"/api/auth/chat-list/", errorMessage1: e.toString());
    }
  }


}

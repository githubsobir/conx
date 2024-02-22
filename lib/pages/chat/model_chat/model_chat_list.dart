class ModelChatList {
  dynamic chatId;
  UserInfo userInfo;

  ModelChatList({
    this.chatId,
    required this.userInfo,
  });

  factory ModelChatList.fromJson(Map<String, dynamic> json) => ModelChatList(
    chatId: json["chat_id"],
    userInfo: UserInfo.fromJson(json["user_info"]),
  );

  Map<String, dynamic> toJson() => {
    "chat_id": chatId,
    "user_info": userInfo.toJson(),
  };
}

class UserInfo {
  dynamic name;
  dynamic avatar;

  UserInfo({
    this.name,
    this.avatar,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
    name: json["name"],
    avatar: json["avatar"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "avatar": avatar,
  };
}

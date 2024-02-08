class ModelGetToken {
  dynamic message;
  Token token;
  dynamic userId;

  ModelGetToken({
     this.message,
    required this.token,
     this.userId,
  });

  factory ModelGetToken.fromJson(Map<String, dynamic> json) => ModelGetToken(
    message: json["message"],
    token: Token.fromJson(json["token"]),
    userId: json["user_id"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "token": token.toJson(),
    "user_id": userId,
  };
}

class Token {
  dynamic refresh;
  dynamic access;

  Token({
    this.refresh,
    this.access,
  });

  factory Token.fromJson(Map<String, dynamic> json) => Token(
    refresh: json["refresh"],
    access: json["access"],
  );

  Map<String, dynamic> toJson() => {
    "refresh": refresh,
    "access": access,
  };
}

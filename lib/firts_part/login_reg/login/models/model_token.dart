class ModelGetTokenLogin {
  dynamic message;
  TokenLogin token;
  dynamic userId;

  ModelGetTokenLogin({
    this.message,
    required this.token,
    this.userId,
  });

  factory ModelGetTokenLogin.fromJson(Map<String, dynamic> json) => ModelGetTokenLogin(
    message: json["message"],
    token: TokenLogin.fromJson(json["token"]),
    userId: json["user_id"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "token": token.toJson(),
    "user_id": userId,
  };
}

class TokenLogin {
  dynamic refresh;
  dynamic access;

  TokenLogin({
    this.refresh,
    this.access,
  });

  factory TokenLogin.fromJson(Map<String, dynamic> json) => TokenLogin(
    refresh: json["refresh"],
    access: json["access"],
  );

  Map<String, dynamic> toJson() => {
    "refresh": refresh,
    "access": access,
  };
}

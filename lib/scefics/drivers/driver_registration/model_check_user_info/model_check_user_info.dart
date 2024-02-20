class ModelCheckUserInfo {
  dynamic passport;
  dynamic license;
  dynamic company;
  dynamic payment;
  dynamic transportDetail;
  dynamic techPassport;
  dynamic images;

  ModelCheckUserInfo({
     this.passport,
     this.license,
     this.company,
     this.payment,
     this.transportDetail,
     this.techPassport,
     this.images,
  });

  factory ModelCheckUserInfo.fromJson(Map<String, dynamic> json) => ModelCheckUserInfo(
    passport: json["passport"],
    license: json["license"],
    company: json["company"],
    payment: json["payment"],
    transportDetail: json["transport_detail"],
    techPassport: json["tech_passport"],
    images: json["images"],
  );

  Map<String, dynamic> toJson() => {
    "passport": passport,
    "license": license,
    "company": company,
    "payment": payment,
    "transport_detail": transportDetail,
    "tech_passport": techPassport,
    "images": images,
  };
}

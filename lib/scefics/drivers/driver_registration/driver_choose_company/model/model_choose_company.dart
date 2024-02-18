class MadelLogisticCompany {
  dynamic id;
  dynamic passportSeriaNumber;
  dynamic companyName;
  dynamic address;
  dynamic country;
  dynamic description;
  dynamic companyPhone;
  dynamic avatar;

  MadelLogisticCompany({
    this.id,
    this.passportSeriaNumber,
    this.companyName,
    this.address,
    this.country,
    this.description,
    this.companyPhone,
    this.avatar,
  });

  factory MadelLogisticCompany.fromJson(Map<String, dynamic> json) => MadelLogisticCompany(
    id: json["id"],
    passportSeriaNumber: json["passport_seria_number"],
    companyName: json["company_name"],
    address: json["address"],
    country: json["country"],
    description: json["description"],
    companyPhone: json["company_phone"],
    avatar: json["avatar"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "passport_seria_number": passportSeriaNumber,
    "company_name": companyName,
    "address": address,
    "country": country,
    "description": description,
    "company_phone": companyPhone,
    "avatar": avatar,
  };
}

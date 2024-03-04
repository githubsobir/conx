
class ModelOrderList99 {
  dynamic search;
  dynamic weightFrom;
  dynamic weightTo;
  dynamic locationFrom;
  dynamic locationTo;
  dynamic volumeFrom;
  dynamic dateFrom;
  dynamic volumeTo;
  dynamic dateTo;
  dynamic typePayment;
  dynamic priceFrom;
  dynamic priceTo;

  ModelOrderList99({
    this.search,
    this.weightFrom,
    this.weightTo,
    this.locationFrom,
    this.locationTo,
    this.volumeFrom,
    this.dateFrom,
    this.volumeTo,
    this.dateTo,
    this.typePayment,
    this.priceFrom,
    this.priceTo,
  });

  factory  ModelOrderList99.fromJson(Map<String, dynamic> json) => ModelOrderList99(
    search: json["search"],
    weightFrom: json["weight_from"],
    weightTo: json["weight_to"],
    locationFrom: json["location_from"],
    locationTo: json["location_to"],
    volumeFrom: json["volume_from"],
    dateFrom: json["date_from"],
    volumeTo: json["volume_to"],
    dateTo: json["date_to"],
    typePayment: json["type_payment"],
    priceFrom: json["price_from"],
    priceTo: json["price_to"],
  );

  Map<String, dynamic> toJson() => {
    "search": search,
    "weight_from": weightFrom,
    "weight_to": weightTo,
    "location_from": locationFrom,
    "location_to": locationTo,
    "volume_from": volumeFrom,
    "date_from": dateFrom,
    "volume_to": volumeTo,
    "date_to": dateTo,
    "type_payment": typePayment,
    "price_from": priceFrom,
    "price_to": priceTo,
  };
}
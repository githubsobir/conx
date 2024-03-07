class ModelOrderList {
  dynamic id;
  dynamic file1;
  dynamic file2;
  dynamic file3;
  dynamic file4;
  dynamic file5;
  dynamic file6;
  dynamic transportType;
  dynamic name;
  Location locationFrom;
  Location locationTo;
  dynamic date;
  dynamic weight;
  dynamic volumeM3;
  dynamic price;
  dynamic typePayment;
  dynamic description;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic status;
  dynamic views;
  dynamic longitude;
  dynamic latitude;

  ModelOrderList({
    this.id,
    this.file1,
    this.file2,
    this.file3,
    this.file4,
    this.file5,
    this.file6,
    this.transportType,
    this.name,
    required this.locationFrom,
    required this.locationTo,
    this.date,
    this.weight,
    this.volumeM3,
    this.price,
    this.typePayment,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.status,
    this.views,
    this.longitude,
    this.latitude,
  });

  factory ModelOrderList.fromJson(Map<String, dynamic> json) => ModelOrderList(
    id: json["id"],
    file1: json["file_1"],
    file2: json["file_2"],
    file3: json["file_3"],
    file4: json["file_4"],
    file5: json["file_5"],
    file6: json["file_6"],
    transportType: json["transport_type"],
    name: json["name"],
    locationFrom: Location.fromJson(json["location_from"]),
    locationTo: Location.fromJson(json["location_to"]),
    date: json["date"],
    weight: json["weight"],
    volumeM3: json["volume_m3"],
    price: json["price"],
    typePayment: json["type_payment"],
    description: json["description"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    status: json["status"],
    views: json["views"],
    longitude: json["longitude"],
    latitude: json["latitude"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "file_1": file1,
    "file_2": file2,
    "file_3": file3,
    "file_4": file4,
    "file_5": file5,
    "file_6": file6,
    "transport_type": transportType,
    "name": name,
    "location_from": locationFrom.toJson(),
    "location_to": locationTo.toJson(),
    "date": date,
    "weight": weight,
    "volume_m3": volumeM3,
    "price": price,
    "type_payment": typePayment,
    "description": description,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "status": status,
    "views": views,
    "longitude": longitude,
    "latitude": latitude,
  };
}

class Location {
  dynamic id;
  dynamic name;

  Location({
    this.id,
    this.name,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

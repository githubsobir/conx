class ModelMainPage {
  dynamic id;
  dynamic transportType;
  dynamic name;
  dynamic locationFrom;
  dynamic locationTo;
  dynamic date;
  dynamic weight;
  dynamic volumeM3;
  dynamic price;
  dynamic typePayment;
  dynamic description;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic status;
  List<OrderFile> orderFiles;

  ModelMainPage({
    this.id,
    this.transportType,
    this.name,
    this.locationFrom,
    this.locationTo,
    this.date,
    this.weight,
    this.volumeM3,
    this.price,
    this.typePayment,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.status,
    required this.orderFiles,
  });

  factory ModelMainPage.fromJson(Map<String, dynamic> json) => ModelMainPage(
        id: json["id"],
        transportType: json["transport_type"],
        name: json["name"],
        locationFrom: json["location_from"],
        locationTo: json["location_to"],
        date: json["date"],
        weight: json["weight"],
        volumeM3: json["volume_m3"],
        price: json["price"],
        typePayment: json["type_payment"],
        description: json["description"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        status: json["status"],
        orderFiles: List<OrderFile>.from(
            json["order_files"].map((x) => OrderFile.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "transport_type": transportType,
        "name": name,
        "location_from": locationFrom,
        "location_to": locationTo,
        "date": date,
        "weight": weight,
        "volume_m3": volumeM3,
        "price": price,
        "type_payment": typePayment,
        "description": description,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "status": status,
        "order_files": List<dynamic>.from(orderFiles.map((x) => x.toJson())),
      };
}

class OrderFile {
  String id;
  String file;

  OrderFile({
    required this.id,
    required this.file,
  });

  factory OrderFile.fromJson(Map<String, dynamic> json) => OrderFile(
        id: json["id"],
        file: json["file"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "file": file,
      };
}

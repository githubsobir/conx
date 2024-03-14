class OrderData {
  dynamic id;
  dynamic file1;
  dynamic file2;
  dynamic file3;
  dynamic file4;
  dynamic file5;
  dynamic file6;
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
  dynamic views;
  dynamic longitude;
  dynamic latitude;

  OrderData(
      {this.id,
      this.file1,
      this.file2,
      this.file3,
      this.file4,
      this.file5,
      this.file6,
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
      this.views,
      this.longitude,
      this.latitude});

  factory OrderData.fromJson(Map<String, dynamic> json) {
    return OrderData(
      id: json['id'],
      file1: json['file_1'],
      file2: json['file_2'],
      file3: json['file_3'],
      file4: json['file_4'],
      file5: json['file_5'],
      file6: json['file_6'],
      transportType: json['transport_type'],
      name: json['name'],
      locationFrom: json['location_from'],
      locationTo: json['location_to'],
      date: json['date'],
      weight: json['weight'],
      volumeM3: json['volume_m3'],
      price: json['price'],
      typePayment: json['type_payment'],
      description: json['description'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      status: json['status'],
      views: json['views'],
      longitude: json['longitude'],
      latitude: json['latitude'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['file_1'] = file1;
    data['file_2'] = file2;
    data['file_3'] = file3;
    data['file_4'] = file4;
    data['file_5'] = file5;
    data['file_6'] = file6;
    data['transport_type'] = transportType;
    data['name'] = name;
    data['location_from'] = locationFrom;
    data['location_to'] = locationTo;
    data['date'] = date;
    data['weight'] = weight;
    data['volume_m3'] = volumeM3;
    data['price'] = price;
    data['type_payment'] = typePayment;
    data['description'] = description;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['status'] = status;
    data['views'] = views;
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    return data;
  }
}

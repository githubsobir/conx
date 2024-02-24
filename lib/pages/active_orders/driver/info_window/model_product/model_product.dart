
class MadelProducts {
  String status;
  ImageProducts image;
  String title;
  String text;
  String price;
  String date;

  MadelProducts({
    required this.status,
    required this.image,
    required this.title,
    required this.text,
    required this.price,
    required this.date,
  });

  factory MadelProducts.fromJson(Map<String, dynamic> json) => MadelProducts(
    status: json["status"],
    image: ImageProducts.fromJson(json["image"]),
    title: json["title"],
    text: json["text"],
    price: json["price"],
    date: json["date"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "image": image.toJson(),
    "title": title,
    "text": text,
    "price": price,
    "date": date,
  };
}

class ImageProducts {
  String id;
  String img;

  ImageProducts({
    required this.id,
    required this.img,
  });

  factory ImageProducts.fromJson(Map<String, dynamic> json) => ImageProducts(
    id: json["id"],
    img: json["img"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "img": img,
  };
}

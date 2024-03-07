class ModelOrderImagesList {
  dynamic idItem;
  List<String> image;

  ModelOrderImagesList({
     this.idItem,
    required this.image,
  });

  factory ModelOrderImagesList.fromJson(Map<String, dynamic> json) => ModelOrderImagesList(
    idItem: json["idItem"],
    image: List<String>.from(json["image"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "image": List<dynamic>.from(image.map((x) => x)),
  };
}

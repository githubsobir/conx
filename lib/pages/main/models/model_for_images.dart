class ModelOrderImagesList {
  List<String> image;

  ModelOrderImagesList({
    required this.image,
  });

  factory ModelOrderImagesList.fromJson(Map<String, dynamic> json) => ModelOrderImagesList(
    image: List<String>.from(json["String"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "image": List<dynamic>.from(image.map((x) => x)),
  };
}

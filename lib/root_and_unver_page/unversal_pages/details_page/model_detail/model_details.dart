import 'package:flutter/material.dart';

class ModelDetailsPage {
  String id;
  String name;
  String name2;
  Icon icon;

  ModelDetailsPage({
    required this.id,
    required this.name,
    required this.name2,
    required this.icon,
  });

  factory ModelDetailsPage.fromJson(Map<String, dynamic> json) =>
      ModelDetailsPage(
        id: json["id"],
        name: json["name"],
        name2: json["name2"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() =>
      {
        "id": id,
        "name": name,
        "flag_img": name,
        "code": icon,
      };
}

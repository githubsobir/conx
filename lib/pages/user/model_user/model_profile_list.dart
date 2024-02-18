import 'package:flutter/material.dart';

class ModelProfileList {

  String id;
  Icon icons;
  String text;
  String note;

  ModelProfileList({
    required this.id,
    required this.icons,
    required this.text,
    required this.note,
  });

  factory ModelProfileList.fromJson({required Map<String, dynamic> json}){
    return ModelProfileList(
      id: json["id"],
      icons: json["icons"],
      text: json["text"],
      note: json["note"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id, "icons": icons, "text": text, "note": note
    };
  }
}
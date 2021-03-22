// To parse this JSON data, do
//
//     final testimony = testimonyFromMap(jsonString);

import 'dart:convert';

Testimony testimonyFromMap(String str) => Testimony.fromMap(json.decode(str));

String testimonyToMap(Testimony data) => json.encode(data.toMap());

class Testimony {
  Testimony({
    this.id,
    this.testimonyId,
    this.testimonyTitle,
    this.testimonyDescription,
    this.testimonyFilePath,
    this.userName,
    this.testimonyCategory,
    this.timestamp,
  });

  int id;
  String testimonyId;
  String testimonyTitle;
  String testimonyDescription;
  String testimonyFilePath;
  String userName;
  String testimonyCategory;
  int timestamp;

  factory Testimony.fromMap(Map<String, dynamic> json) => Testimony(
    id: json["id"],
    testimonyId: json["testimony_id"],
    testimonyTitle: json["testimony_title"],
    testimonyDescription: json["testimony_description"],
    testimonyFilePath: json["testimony_file_path"],
    userName: json["user_name"],
    testimonyCategory: json["testimony_category"],
    timestamp: json["timestamp"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "testimony_id": testimonyId,
    "testimony_title": testimonyTitle,
    "testimony_description": testimonyDescription,
    "testimony_file_path": testimonyFilePath,
    "user_name": userName,
    "testimony_category": testimonyCategory,
    "timestamp": timestamp,
  };
}

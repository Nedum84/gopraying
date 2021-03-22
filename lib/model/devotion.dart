// To parse this JSON data, do
//
//     final devotion = devotionFromMap(jsonString);

import 'dart:convert';

Devotion devotionFromMap(String str) => Devotion.fromMap(json.decode(str));

String devotionToMap(Devotion data) => json.encode(data.toMap());

class Devotion {
  Devotion({
    this.devotionId,
    this.devotionTitle,
    this.devotionMessage,
    this.devotionBannerPath,
    this.userName,
    this.category,
    this.devotionDate,
    this.timestamp,
  });

  int devotionId;
  String devotionTitle;
  String devotionMessage;
  String devotionBannerPath;
  String userName;
  String category;
  int devotionDate;
  int timestamp;

  factory Devotion.fromMap(Map<String, dynamic> json) => Devotion(
        devotionId: json["devotion_id"],
        devotionTitle: json["devotion_title"],
        devotionMessage: json["devotion_message"],
        devotionBannerPath: json["devotion_banner_path"],
        userName: json["user_name"],
        category: json["category"],
        devotionDate: json["devotion_date"],
        timestamp: json["timestamp"],
      );

  Map<String, dynamic> toMap() => {
        "devotion_id": devotionId,
        "devotion_title": devotionTitle,
        "devotion_message": devotionMessage,
        "devotion_banner_path": devotionBannerPath,
        "user_name": userName,
        "category": category,
        "devotion_date": devotionDate,
        "timestamp": timestamp,
      };
}

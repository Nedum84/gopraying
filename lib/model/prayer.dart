// To parse this JSON data, do
//
//     final prayer = prayerFromMap(jsonString);

import 'dart:convert';

Prayer prayerFromMap(String str) => Prayer.fromMap(json.decode(str));

String prayerToMap(Prayer data) => json.encode(data.toMap());

class Prayer {
  Prayer({
    this.id,
    this.prayerId,
    this.prayerTitle,
    this.prayerDescription,
    this.prayerFilePath,
    this.userName,
    this.prayerCategory,
    this.timestamp,
  });

  int id;
  String prayerId;
  String prayerTitle;
  String prayerDescription;
  String prayerFilePath;
  String userName;
  String prayerCategory;
  int timestamp;

  factory Prayer.fromMap(Map<String, dynamic> json) => Prayer(
        id: json["id"],
        prayerId: json["prayer_id"],
        prayerTitle: json["prayer_title"],
        prayerDescription: json["prayer_description"],
        prayerFilePath: json["prayer_file_path"],
        userName: json["user_name"],
        prayerCategory: json["prayer_category"],
        timestamp: json["timestamp"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "prayer_id": prayerId,
        "prayer_title": prayerTitle,
        "prayer_description": prayerDescription,
        "prayer_file_path": prayerFilePath,
        "user_name": userName,
        "prayer_category": prayerCategory,
        "timestamp": timestamp,
      };
}

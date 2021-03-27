// To parse this JSON data, do
//
//     final prayer = prayerFromMap(jsonString);

import 'dart:convert';

import 'package:flutter/foundation.dart';

Prayer prayerFromMap(String str) => Prayer.fromMap(json.decode(str));

String prayerToMap(Prayer data) => json.encode(data.toMap());

class Prayer extends ChangeNotifier {
  void onUpdateNoOfComment(int commentNo) {
    noOfComment = commentNo;
    notifyListeners();
  }

  void update(Prayer prayer) {
    this.noOfComment = prayer.noOfComment;
    this.noOfPrays = prayer.noOfPrays;
    this.havePrayed = prayer.havePrayed;
    this.prayerFilePath = prayer.prayerFilePath;
    this.prayerCategory = prayer.prayerCategory;
    notifyListeners();
  }

  Prayer({
    this.id = 0,
    this.prayerId,
    this.prayerTitle,
    this.prayerDescription,
    this.prayerFilePath,
    this.userName,
    this.prayerCategory,
    this.noOfComment,
    this.noOfPrays,
    this.havePrayed,
    this.timestamp,
  });

  int id;
  String prayerId;
  String prayerTitle;
  String prayerDescription;
  String prayerFilePath;
  String userName;
  String prayerCategory;
  int noOfComment;
  int noOfPrays;
  bool havePrayed;
  int timestamp;

  bool isImgEmpty() => prayerFilePath == "" || prayerFilePath == null;

  factory Prayer.fromMap(Map<String, dynamic> json) => Prayer(
        id: json["id"],
        prayerId: json["prayer_id"],
        prayerTitle: json["prayer_title"],
        prayerDescription: json["prayer_description"],
        prayerFilePath: json["prayer_file_path"],
        userName: json["user_name"],
        prayerCategory: json["prayer_category"],
        noOfComment: json["no_of_comment"],
        noOfPrays: json["no_of_prays"],
        havePrayed: json["have_prayed"] == 'true',
        timestamp: json["timestamp"],
      );

  Map<String, dynamic> toMap() => {
        "id": id.toString(),
        "prayer_id": prayerId,
        "prayer_title": prayerTitle,
        "prayer_description": prayerDescription,
        "prayer_file_path": prayerFilePath,
        "user_name": userName,
        "prayer_category": prayerCategory,
        "no_of_comment": noOfComment.toString(),
        "no_of_prays": noOfPrays.toString(),
        "have_prayed": havePrayed.toString(),
        "timestamp": timestamp.toString(),
      };
}

// To parse this JSON data, do
//
//     final globalPrayer = globalPrayerFromMap(jsonString);

import 'dart:convert';

GlobalPrayer globalPrayerFromMap(String str) => GlobalPrayer.fromMap(json.decode(str));

String globalPrayerToMap(GlobalPrayer data) => json.encode(data.toMap());

class GlobalPrayer {
  GlobalPrayer({
    this.prayerId,
    this.prayerTitle,
    this.prayerDescription,
    this.prayerBannerPath,
    this.userName,
    this.category,
    this.startDate,
    this.endDate,
    this.timestamp,
  });

  int prayerId;
  String prayerTitle;
  String prayerDescription;
  String prayerBannerPath;
  String userName;
  String category;
  int startDate;
  int endDate;
  int timestamp;

  factory GlobalPrayer.fromMap(Map<String, dynamic> json) => GlobalPrayer(
        prayerId: json["prayer_id"],
        prayerTitle: json["prayer_title"],
        prayerDescription: json["prayer_description"],
        prayerBannerPath: json["prayer_banner_path"],
        userName: json["user_name"],
        category: json["category"],
        startDate: json["start_date"],
        endDate: json["end_date"],
        timestamp: json["timestamp"],
      );

  Map<String, dynamic> toMap() => {
        "prayer_id": prayerId,
        "prayer_title": prayerTitle,
        "prayer_description": prayerDescription,
        "prayer_banner_path": prayerBannerPath,
        "user_name": userName,
        "category": category,
        "start_date": startDate,
        "end_date": endDate,
        "timestamp": timestamp,
      };
}

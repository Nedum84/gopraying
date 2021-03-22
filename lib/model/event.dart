// To parse this JSON data, do
//
//     final event = eventFromMap(jsonString);

import 'dart:convert';

Event eventFromMap(String str) => Event.fromMap(json.decode(str));

String eventToMap(Event data) => json.encode(data.toMap());

class Event {
  Event({
    this.prayerId,
    this.eventTitle,
    this.eventDescription,
    this.eventBannerPath,
    this.userName,
    this.category,
    this.startDate,
    this.endDate,
    this.timestamp,
  });

  int prayerId;
  String eventTitle;
  String eventDescription;
  String eventBannerPath;
  String userName;
  String category;
  int startDate;
  int endDate;
  int timestamp;

  factory Event.fromMap(Map<String, dynamic> json) => Event(
        prayerId: json["prayer_id"],
        eventTitle: json["event_title"],
        eventDescription: json["event_description"],
        eventBannerPath: json["event_banner_path"],
        userName: json["user_name"],
        category: json["category"],
        startDate: json["start_date"],
        endDate: json["end_date"],
        timestamp: json["timestamp"],
      );

  Map<String, dynamic> toMap() => {
        "prayer_id": prayerId,
        "event_title": eventTitle,
        "event_description": eventDescription,
        "event_banner_path": eventBannerPath,
        "user_name": userName,
        "category": category,
        "start_date": startDate,
        "end_date": endDate,
        "timestamp": timestamp,
      };
}

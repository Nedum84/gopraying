// To parse this JSON data, do
//
//     final globalPrayerJoiners = globalPrayerJoinersFromMap(jsonString);

import 'dart:convert';

GlobalPrayerJoiners globalPrayerJoinersFromMap(String str) => GlobalPrayerJoiners.fromMap(json.decode(str));

String globalPrayerJoinersToMap(GlobalPrayerJoiners data) => json.encode(data.toMap());

class GlobalPrayerJoiners {
  GlobalPrayerJoiners({
    this.id,
    this.eventId,
    this.userId,
    this.timestamp,
  });

  int id;
  int eventId;
  int userId;
  int timestamp;

  factory GlobalPrayerJoiners.fromMap(Map<String, dynamic> json) => GlobalPrayerJoiners(
        id: json["id"],
        eventId: json["event_id"],
        userId: json["user_id"],
        timestamp: json["timestamp"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "event_id": eventId,
        "user_id": userId,
        "timestamp": timestamp,
      };
}

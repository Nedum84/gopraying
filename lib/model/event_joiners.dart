// To parse this JSON data, do
//
//     final eventJoiners = eventJoinersFromMap(jsonString);

import 'dart:convert';

EventJoiners eventJoinersFromMap(String str) => EventJoiners.fromMap(json.decode(str));

String eventJoinersToMap(EventJoiners data) => json.encode(data.toMap());

class EventJoiners {
  EventJoiners({
    this.id,
    this.eventId,
    this.userId,
    this.timestamp,
  });

  int id;
  int eventId;
  int userId;
  int timestamp;

  factory EventJoiners.fromMap(Map<String, dynamic> json) => EventJoiners(
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

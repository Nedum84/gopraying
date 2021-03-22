// To parse this JSON data, do
//
//     final testimonyLikes = testimonyLikesFromMap(jsonString);

import 'dart:convert';

TestimonyLikes testimonyLikesFromMap(String str) => TestimonyLikes.fromMap(json.decode(str));

String testimonyLikesToMap(TestimonyLikes data) => json.encode(data.toMap());

class TestimonyLikes {
  TestimonyLikes({
    this.id,
    this.testimonyId,
    this.userId,
    this.timestamp,
  });

  int id;
  int testimonyId;
  int userId;
  int timestamp;

  factory TestimonyLikes.fromMap(Map<String, dynamic> json) => TestimonyLikes(
        id: json["id"],
        testimonyId: json["testimony_id"],
        userId: json["user_id"],
        timestamp: json["timestamp"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "testimony_id": testimonyId,
        "user_id": userId,
        "timestamp": timestamp,
      };
}

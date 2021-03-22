// To parse this JSON data, do
//
//     final globalPrayerComment = globalPrayerCommentFromMap(jsonString);

import 'dart:convert';

GlobalPrayerComment globalPrayerCommentFromMap(String str) => GlobalPrayerComment.fromMap(json.decode(str));

String globalPrayerCommentToMap(GlobalPrayerComment data) => json.encode(data.toMap());

class GlobalPrayerComment {
  GlobalPrayerComment({
    this.commentId,
    this.commentMessage,
    this.prayerId,
    this.userName,
    this.timestamp,
  });

  int commentId;
  String commentMessage;
  int prayerId;
  String userName;
  int timestamp;

  factory GlobalPrayerComment.fromMap(Map<String, dynamic> json) => GlobalPrayerComment(
        commentId: json["comment_id"],
        commentMessage: json["comment_message"],
        prayerId: json["prayer_id"],
        userName: json["user_name"],
        timestamp: json["timestamp"],
      );

  Map<String, dynamic> toMap() => {
        "comment_id": commentId,
        "comment_message": commentMessage,
        "prayer_id": prayerId,
        "user_name": userName,
        "timestamp": timestamp,
      };
}

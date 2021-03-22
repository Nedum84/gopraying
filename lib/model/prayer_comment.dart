// To parse this JSON data, do
//
//     final prayerComment = prayerCommentFromMap(jsonString);

import 'dart:convert';

PrayerComment prayerCommentFromMap(String str) => PrayerComment.fromMap(json.decode(str));

String prayerCommentToMap(PrayerComment data) => json.encode(data.toMap());

class PrayerComment {
  PrayerComment({
    this.id,
    this.commentId,
    this.commentMessage,
    this.commentFilePath,
    this.prayerId,
    this.userName,
    this.timestamp,
  });

  int id;
  String commentId;
  String commentMessage;
  String commentFilePath;
  int prayerId;
  String userName;
  int timestamp;

  factory PrayerComment.fromMap(Map<String, dynamic> json) => PrayerComment(
        id: json["id"],
        commentId: json["comment_id"],
        commentMessage: json["comment_message"],
        commentFilePath: json["comment_file_path"],
        prayerId: json["prayer_id"],
        userName: json["user_name"],
        timestamp: json["timestamp"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "comment_id": commentId,
        "comment_message": commentMessage,
        "comment_file_path": commentFilePath,
        "prayer_id": prayerId,
        "user_name": userName,
        "timestamp": timestamp,
      };
}

// To parse this JSON data, do
//
//     final devotionComment = devotionCommentFromMap(jsonString);

import 'dart:convert';

DevotionComment devotionCommentFromMap(String str) => DevotionComment.fromMap(json.decode(str));

String devotionCommentToMap(DevotionComment data) => json.encode(data.toMap());

class DevotionComment {
  DevotionComment({
    this.commentId,
    this.commentMessage,
    this.devotionId,
    this.userName,
    this.timestamp,
  });

  int commentId;
  String commentMessage;
  int devotionId;
  String userName;
  int timestamp;

  factory DevotionComment.fromMap(Map<String, dynamic> json) => DevotionComment(
        commentId: json["comment_id"],
        commentMessage: json["comment_message"],
        devotionId: json["devotion_id"],
        userName: json["user_name"],
        timestamp: json["timestamp"],
      );

  Map<String, dynamic> toMap() => {
        "comment_id": commentId,
        "comment_message": commentMessage,
        "devotion_id": devotionId,
        "user_name": userName,
        "timestamp": timestamp,
      };
}

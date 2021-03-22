// To parse this JSON data, do
//
//     final testimonyComment = testimonyCommentFromMap(jsonString);

import 'dart:convert';

TestimonyComment testimonyCommentFromMap(String str) => TestimonyComment.fromMap(json.decode(str));

String testimonyCommentToMap(TestimonyComment data) => json.encode(data.toMap());

class TestimonyComment {
  TestimonyComment({
    this.commentId,
    this.commentMessage,
    this.testimonyId,
    this.userName,
    this.timestamp,
  });

  int commentId;
  String commentMessage;
  int testimonyId;
  String userName;
  int timestamp;

  factory TestimonyComment.fromMap(Map<String, dynamic> json) => TestimonyComment(
        commentId: json["comment_id"],
        commentMessage: json["comment_message"],
        testimonyId: json["testimony_id"],
        userName: json["user_name"],
        timestamp: json["timestamp"],
      );

  Map<String, dynamic> toMap() => {
        "comment_id": commentId,
        "comment_message": commentMessage,
        "testimony_id": testimonyId,
        "user_name": userName,
        "timestamp": timestamp,
      };
}

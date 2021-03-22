// To parse this JSON data, do
//
//     final eventComment = eventCommentFromMap(jsonString);

import 'dart:convert';

EventComment eventCommentFromMap(String str) => EventComment.fromMap(json.decode(str));

String eventCommentToMap(EventComment data) => json.encode(data.toMap());

class EventComment {
  EventComment({
    this.commentId,
    this.commentMessage,
    this.eventId,
    this.userName,
    this.timestamp,
  });

  int commentId;
  String commentMessage;
  int eventId;
  String userName;
  int timestamp;

  factory EventComment.fromMap(Map<String, dynamic> json) => EventComment(
        commentId: json["comment_id"],
        commentMessage: json["comment_message"],
        eventId: json["event_id"],
        userName: json["user_name"],
        timestamp: json["timestamp"],
      );

  Map<String, dynamic> toMap() => {
        "comment_id": commentId,
        "comment_message": commentMessage,
        "event_id": eventId,
        "user_name": userName,
        "timestamp": timestamp,
      };
}

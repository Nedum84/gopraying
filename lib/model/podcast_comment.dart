// To parse this JSON data, do
//
//     final podcastComment = podcastCommentFromMap(jsonString);

import 'dart:convert';

PodcastComment podcastCommentFromMap(String str) => PodcastComment.fromMap(json.decode(str));

String podcastCommentToMap(PodcastComment data) => json.encode(data.toMap());

class PodcastComment {
  PodcastComment({
    this.commentId,
    this.commentMessage,
    this.podcastId,
    this.userName,
    this.timestamp,
  });

  int commentId;
  String commentMessage;
  int podcastId;
  String userName;
  int timestamp;

  factory PodcastComment.fromMap(Map<String, dynamic> json) => PodcastComment(
        commentId: json["comment_id"],
        commentMessage: json["comment_message"],
        podcastId: json["podcast_id"],
        userName: json["user_name"],
        timestamp: json["timestamp"],
      );

  Map<String, dynamic> toMap() => {
        "comment_id": commentId,
        "comment_message": commentMessage,
        "podcast_id": podcastId,
        "user_name": userName,
        "timestamp": timestamp,
      };
}

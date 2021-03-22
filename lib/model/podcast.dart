// To parse this JSON data, do
//
//     final podcast = podcastFromMap(jsonString);

import 'dart:convert';

Podcast podcastFromMap(String str) => Podcast.fromMap(json.decode(str));

String podcastToMap(Podcast data) => json.encode(data.toMap());

class Podcast {
  Podcast({
    this.podcastId,
    this.podcastTitle,
    this.podcastDescription,
    this.podcastBannerPath,
    this.podcastFilePath,
    this.podcastDuration,
    this.userName,
    this.category,
    this.timestamp,
  });

  int podcastId;
  String podcastTitle;
  String podcastDescription;
  int podcastBannerPath;
  String podcastFilePath;
  int podcastDuration;
  String userName;
  String category;
  int timestamp;

  factory Podcast.fromMap(Map<String, dynamic> json) => Podcast(
        podcastId: json["podcast_id"],
        podcastTitle: json["podcast_title"],
        podcastDescription: json["podcast_description"],
        podcastBannerPath: json["podcast_banner_path"],
        podcastFilePath: json["podcast_file_path"],
        podcastDuration: json["podcast_duration"],
        userName: json["user_name"],
        category: json["category"],
        timestamp: json["timestamp"],
      );

  Map<String, dynamic> toMap() => {
        "podcast_id": podcastId,
        "podcast_title": podcastTitle,
        "podcast_description": podcastDescription,
        "podcast_banner_path": podcastBannerPath,
        "podcast_file_path": podcastFilePath,
        "podcast_duration": podcastDuration,
        "user_name": userName,
        "category": category,
        "timestamp": timestamp,
      };
}

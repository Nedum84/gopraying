// To parse this JSON data, do
//
//     final prayerCommit = prayerCommitFromMap(jsonString);

import 'dart:convert';

PrayerCommit prayerCommitFromMap(String str) => PrayerCommit.fromMap(json.decode(str));

String prayerCommitToMap(PrayerCommit data) => json.encode(data.toMap());

class PrayerCommit {
  PrayerCommit({
    this.commitId,
    this.prayerId,
    this.userId,
    this.timestamp,
  });

  int commitId;
  int prayerId;
  int userId;
  int timestamp;

  factory PrayerCommit.fromMap(Map<String, dynamic> json) => PrayerCommit(
        commitId: json["commit_id"],
        prayerId: json["prayer_id"],
        userId: json["user_id"],
        timestamp: json["timestamp"],
      );

  Map<String, dynamic> toMap() => {
        "commit_id": commitId,
        "prayer_id": prayerId,
        "user_id": userId,
        "timestamp": timestamp,
      };
}

import 'dart:convert';

AppUser appUserFromMap(String str) => AppUser.fromMap(json.decode(str));

String appUserToMap(AppUser data) => json.encode(data.toMap());

class AppUser {
  AppUser({
    this.userId,
    this.uid,
    this.name,
    this.email,
    this.phone,
    this.dateCreated,
    this.profilePhotoUrl,
    this.accessLevel,
    this.deviceToken,
    this.showNotification,
  });

  int userId;
  String uid;
  String name;
  String email;
  String phone;
  int dateCreated;
  String profilePhotoUrl;
  int accessLevel;
  String deviceToken;
  bool showNotification;

  bool isTeacher()=> accessLevel==2;

  factory AppUser.fromMap(Map<String, dynamic> json) => AppUser(
    userId: json["user_id"],
    uid: json["uid"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"].toString(),
    dateCreated: json["date_created"],
    profilePhotoUrl: json["profile_photo_url"],
    accessLevel: json["access_level"],
    deviceToken: json["device_token"],
    showNotification: (json["show_notification"] ==1||json["show_notification"]==true)?true:false,
  );

  Map<String, dynamic> toMap() => {
    "user_id": userId,
    "uid": uid,
    "name": name,
    "email": email,
    "phone": phone,
    "date_created": dateCreated,
    "profile_photo_url": profilePhotoUrl,
    "access_level": accessLevel,
    "device_token": deviceToken,
    "show_notification": showNotification,
  };
}

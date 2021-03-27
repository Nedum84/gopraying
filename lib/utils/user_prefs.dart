import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gopraying/model/app_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

const U_ID = "user_id";
const U_NAME = "user_name";
const U_DETAILS = "user_details";
const FIRST_TIME_APP_OPENING = "first_time_app_opening";

Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class UserPrefs {
  // user id
  void setUID({@required int userId}) async {
    // SharedPreferences _prefs = await  SharedPreferences.getInstance();
    (await _prefs).setInt(U_ID, userId);
  }

  static Future<int> getUID() async {
    return (await _prefs).getInt(U_ID);
  }

  // user name
  void setUName({@required String userName}) async {
    (await _prefs).setString(U_NAME, userName);
  }

  Future<String> getUName() async {
    return (await _prefs).getString(U_NAME);
  }

  // all the user details
  void setUDetails({@required AppUser appUser}) async {
    var user = appUser.toMap();
    var uDetails = jsonEncode(user);
    (await _prefs).setString(U_DETAILS, uDetails);
  }

  static Future<AppUser> getUDetails() async {
    var appUser = (await _prefs).getString(U_DETAILS);
    return AppUser.fromMap(jsonDecode(appUser));
  }

  // user name
  void setFirstTimeOpen({@required bool isFirstTime}) async {
    (await _prefs).setBool(FIRST_TIME_APP_OPENING, isFirstTime);
  }

  static Future<bool> getFirstTimeOpen() async {
    return ((await _prefs).getBool(FIRST_TIME_APP_OPENING)) ?? true;
  }

  // user is logged in
  static Future<bool> isLoggedIn() async {
    return (await getUID()) != 0;
  }

  // logout
  static Future<bool> signOut() async {
    UserPrefs().setUID(userId: null);
    return (await _prefs).clear();
  }
}

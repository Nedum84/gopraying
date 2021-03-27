import 'package:flutter/foundation.dart';
import 'package:gopraying/model/app_user.dart';
import 'package:gopraying/utils/user_prefs.dart';

class UserProvider with ChangeNotifier {
  AppUser _user;

  AppUser get getUser => _user;

  void refreshUser() async {
    AppUser user = await UserPrefs.getUDetails();
    _user = user;
    notifyListeners();
  }
}

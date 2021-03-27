import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:gopraying/model/prayer.dart';
import 'package:gopraying/repository/prayer_repo.dart';

class PrayerProvider extends ChangeNotifier {
  List<Prayer> _prayers = [];

  UnmodifiableListView<Prayer> get prayers {
    return UnmodifiableListView(_prayers);
  }

  // UnmodifiableListView<Prayer> get prays => UnmodifiableListView(_prayers);

  int get prayerCount {
    return _prayers.length;
  }

  void updatePrayer({@required int userId}) async {
    await Future.value(2);
    onIsLoading(loading: true);
    final prayers = await PrayerRepo.getPrayerAll(userId: userId);
    if (prayers != null) {
      _prayers.clear();
      _prayers.addAll(prayers);
    }
    onIsLoading(loading: false);
  }

  //Is Data loading from the internet
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  void onIsLoading({bool loading}) {
    _isLoading = loading;
    notifyListeners();
  }
}

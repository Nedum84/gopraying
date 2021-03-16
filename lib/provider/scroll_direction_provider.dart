import 'package:flutter/foundation.dart';

class ScrollDirectionProvider extends ChangeNotifier {
  bool _onScrollUp = true;

  bool get scrollUp => _onScrollUp;

  void onScrollChange(bool val) {
    _onScrollUp = val;
    notifyListeners();
  }
}

import 'package:flutter/foundation.dart';


class BottomMenuProvider with ChangeNotifier {
  int _bottomMenuIndex;

  int get bottomMenuItem => _bottomMenuIndex;

  void onChangeMenu(int index){
    _bottomMenuIndex = index;
    notifyListeners();
  }

}

import 'package:flutter/cupertino.dart';

class UiProvider extends ChangeNotifier {
  int _selectMenuOption = 0;

  int get selectMenuopt {
    return this._selectMenuOption;
  }

  set selectedMenu(int i) {
    this._selectMenuOption = i;
    notifyListeners();
  }
}

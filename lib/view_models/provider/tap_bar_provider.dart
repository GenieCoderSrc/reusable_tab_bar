import 'package:flutter/material.dart';

class TapBarProvider extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void onChangeIndex(int index) {
    Future<void>.delayed(const Duration(milliseconds: 500), () {
      _selectedIndex = index;
      debugPrint('TapBarProvider | Current Index: $_selectedIndex');
      notifyListeners();
    });
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{
  bool _isLight = TimeOfDay.now().period == DayPeriod.am;

  void changeTheme(){
    _isLight = !_isLight;
    notifyListeners();
  }

  bool get isLightTheme => _isLight;
}
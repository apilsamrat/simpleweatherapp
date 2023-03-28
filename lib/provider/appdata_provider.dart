import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppDataProvider with ChangeNotifier {
  final SharedPreferences pref;
  AppDataProvider({required this.pref});

  void setIsFirstTime({required bool value}) {
    pref.setBool("isFirstTime", value);
    notifyListeners();
  }

  getIsFirstTime() {
    return pref.getBool("isFirstTime");
  }
}

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddressProvider with ChangeNotifier {
  final SharedPreferences pref;

  AddressProvider({required this.pref});

  void setAddress({required String value}) async {
    await pref.setString("address", value);
    notifyListeners();
  }

  String? getAddress() {
    return pref.getString("address");
  }
}

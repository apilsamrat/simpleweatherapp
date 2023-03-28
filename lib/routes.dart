import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simpleweatherapp/provider/appdata_provider.dart';
import 'package:simpleweatherapp/screens/help/help.dart';
import 'package:simpleweatherapp/screens/home/home.dart';

Map<String, Widget Function(BuildContext)> approutes = {
  "/": (context) =>
      Provider.of<AppDataProvider>(context).getIsFirstTime() == null ||
              Provider.of<AppDataProvider>(context).getIsFirstTime() == true
          ? const HelpPage()
          : const HomePage(),
};

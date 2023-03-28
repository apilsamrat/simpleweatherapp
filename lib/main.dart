//TODO : Please don't forget to make changes as mentioned in lib/secrets/api_key2.dart.
 
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simpleweatherapp/provider/address_provider.dart';
import 'package:simpleweatherapp/provider/appdata_provider.dart';
import 'package:simpleweatherapp/routes.dart';
import 'package:simpleweatherapp/utilities/theme.dart';

SharedPreferences? prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();

  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (context) => AddressProvider(pref: prefs!)),
          ChangeNotifierProvider(
              create: (context) => AppDataProvider(pref: prefs!)),
        ],
        builder: (context, child) {
          return MaterialApp(
            title: "Simple Weather App",
            debugShowCheckedModeBanner: false,
            theme: theme,
            initialRoute: "/",
            routes: approutes,
          );
        });
  }
}

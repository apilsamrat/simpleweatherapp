import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simpleweatherapp/provider/appdata_provider.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({super.key});

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(const Duration(seconds: 5), () {
        Provider.of<AppDataProvider>(context, listen: false)
            .setIsFirstTime(value: false);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Center(
                child: Text(
                  "We Show Weather For You",
                  style: GoogleFonts.urbanist(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            TextButton(
                onPressed: () {
                  Provider.of<AppDataProvider>(context, listen: false)
                      .setIsFirstTime(value: false);
                },
                child: const Text("Skip")),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

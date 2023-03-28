// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simpleweatherapp/globalcomponents/ask_location_permission_dialog.dart';

import 'package:http/http.dart' as http;
import 'package:simpleweatherapp/main.dart';

import 'package:simpleweatherapp/provider/address_provider.dart';
import 'package:simpleweatherapp/provider/appdata_provider.dart';
import 'package:simpleweatherapp/secrets/api_key.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController textEditingController = TextEditingController();
  String apikey = globalApiKey;
  Position? position;

  Future<Position> getLocation() async {
    LocationPermission locationPermission = await Geolocator.checkPermission();

    if (locationPermission == LocationPermission.denied) {
      await Geolocator.requestPermission();
    } else if (locationPermission == LocationPermission.deniedForever) {
      askLocation(context: context);
    }
    position = await getLocation();

    return await Geolocator.getCurrentPosition();
  }

  @override
  void initState() {
    textEditingController.value =
        TextEditingValue(text: prefs?.getString("address") ?? "");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Simple Weather App"),
        actions: [
          TextButton.icon(
              onPressed: () {
                Provider.of<AppDataProvider>(context, listen: false)
                    .setIsFirstTime(value: true);
              },
              icon: const Icon(IconlyBroken.infoCircle),
              label: const Text("Help"))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Flexible(
                  child: SizedBox(
                    child: TextFormField(
                      controller: textEditingController,
                      style: GoogleFonts.urbanist(),
                      decoration: const InputDecoration(
                        prefixIcon: Icon(IconlyBold.location),
                        hintText: "eg. Bhairahawa",
                        label: Text("Input Location"),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Provider.of<AddressProvider>(context, listen: false)
                          .setAddress(value: textEditingController.text);
                    },
                    child: Provider.of<AddressProvider>(context).getAddress() ==
                            null
                        ? const Text("Save")
                        : const Text("Update")),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text("Temperature on your area.",
                style: GoogleFonts.urbanist(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: const Color(0XFF0F0E13),
                    height: 1.5)),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            alignment: Alignment.center,
            child: Provider.of<AddressProvider>(context, listen: true)
                        .getAddress() ==
                    null
                ? FutureBuilder(
                    future: Geolocator.getCurrentPosition(),
                    builder: (context, locationSnapshot) {
                      if (locationSnapshot.hasData) {
                        return FutureBuilder(
                          future: callWithPosition(
                              uri: Uri.parse(
                                  "http://api.weatherapi.com/v1/current.json?key=$apikey&q=${locationSnapshot.data!.latitude.toString()},${locationSnapshot.data!.longitude.toString()}")),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              Map<String, dynamic> data = jsonDecode(
                                  (snapshot.data as http.Response).body);
                              if (data["location"] != null) {
                                return weatherCard(data);
                              } else {
                                return Text(
                                  "Something went wrong",
                                  style: GoogleFonts.urbanist(),
                                );
                              }
                            } else if (snapshot.hasError) {
                              return Text(
                                "Error Occured!",
                                style: GoogleFonts.urbanist(),
                              );
                            } else {
                              return const CupertinoActivityIndicator(
                                  color: Colors.red);
                            }
                          },
                        );
                      } else if (locationSnapshot.hasError) {
                        return Text(
                          "Cannot get your location data. Make sure your connections are turned on!",
                          style: GoogleFonts.urbanist(fontSize: 20),
                        );
                      } else {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const CupertinoActivityIndicator(),
                            Text(
                                "Please wait while we get your current location.",
                                style: GoogleFonts.urbanist(fontSize: 20)),
                          ],
                        );
                      }
                    },
                  )
                : FutureBuilder(
                    future: callWithAddress(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        Map<String, dynamic> data =
                            jsonDecode((snapshot.data as http.Response).body);
                        if (data["location"] != null) {
                          return weatherCard(data);
                        } else {
                          return Text(
                            "Something went wrong",
                            style: GoogleFonts.urbanist(),
                          );
                        }
                      } else if (snapshot.hasError) {
                        return Text(
                          "Error Occured!",
                          style: GoogleFonts.urbanist(),
                        );
                      } else {
                        return const CupertinoActivityIndicator(
                            color: Colors.red);
                      }
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Card weatherCard(Map<String, dynamic> data) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                const Icon(IconlyBroken.location),
                Text(
                  data["location"]["name"].toString(),
                  style: GoogleFonts.urbanist(
                      fontSize: 17, fontWeight: FontWeight.bold),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(data["current"]["condition"]["icon"].toString()),
                Text(
                  "${data["current"]["temp_c"].toString()}°C",
                  style: GoogleFonts.vt323(
                      fontSize: 35, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Text(
              data["current"]["condition"]["text"].toString(),
              style: GoogleFonts.urbanist(
                  fontSize: 25, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Future<http.Response> callWithPosition({required Uri uri}) async {
    return await http.get(uri);
  }

  Future<http.Response> callWithAddress() async {
    return await http.get(Uri.parse(
        "http://api.weatherapi.com/v1/current.json?key=$apikey&q=${Provider.of<AddressProvider>(context).getAddress()}"));
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simpleweatherapp/globalcomponents/toaster.dart';
import 'package:simpleweatherapp/styles/buttonstyle.dart';
import 'package:simpleweatherapp/utilities/colors.dart';

Future<bool> askLocation({required BuildContext context}) async {
  return await showModalBottomSheet(
      context: context,
      useSafeArea: true,
      isDismissible: false,
      isScrollControlled: false,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                  child: Container(
                    width: 48,
                    height: 4,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: primaryBlack),
                  ),
                ),
              ),
              Text(
                "Location Permission Denied Forever :(",
                style: GoogleFonts.urbanist(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: const Color(0XFF0F0E13),
                    height: 1.5),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 24),
                child: Text(
                  "Please provide location permission to use this app properly",
                  style: GoogleFonts.urbanist(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: const Color(0XFF787486),
                      height: 1.5),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 48,
                    width: double.infinity,
                    child: TextButton(
                        onPressed: () async {
                          if (!kIsWeb) {
                            await Geolocator.openLocationSettings();
                          } else {
                            Navigator.of(context).pop();
                            AwesomeToaster.showToast(
                                context: context,
                                msg:
                                    "Not supported on web. Please provide the permission manually.");
                          }
                        },
                        style: primaryButtonStyle.copyWith(
                            backgroundColor:
                                MaterialStatePropertyAll(primaryColor)),
                        child: const Text("Go to Settings")),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18, bottom: 0),
                    child: TextButton(
                        onPressed: () {
                          Navigator.pop(context, false);
                        },
                        style: primaryTransparentButtonStyle.copyWith(
                            textStyle: MaterialStatePropertyAll(
                                GoogleFonts.urbanist(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0XFF787486),
                                    height: 1.5)),
                            foregroundColor:
                                MaterialStatePropertyAll(primaryRed)),
                        child: const Text("Exit App")),
                  ),
                ],
              )
            ],
          ),
        );
      });
}

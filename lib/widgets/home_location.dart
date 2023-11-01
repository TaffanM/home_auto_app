import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeLocation extends StatefulWidget {
  const HomeLocation({super.key});

  @override
  State<HomeLocation> createState() => _HomeLocationState();
}

class _HomeLocationState extends State<HomeLocation> {
  var currentLocation = "Mencari lokasi saat ini...";

  Future<void> getCurrentLocation() async {
    bool hasPermission = await checkLocationPermission();

    if (!hasPermission) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Izin Lokasi"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Tutup'))
            ],
          );
        },
      );
      return;
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    List<Placemark> placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );

    Placemark place = placemarks[0]; // Get the first place (most accurate)

    String address =
        "${place.locality!.split(" ")[1]}, ${place.subAdministrativeArea}";

    setState(() {
      currentLocation = address;
    });

    print("Current Location: ${position.latitude}, ${position.longitude}");
    print("Address: $address");
  }

  Future<bool> checkLocationPermission() async {
    final status = await Permission.location.status;

    if (status.isGranted) {
      return true;
    } else if (status.isDenied) {
      await Permission.location.request();
      return false;
    } else {
      return false;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.location_on_outlined,
          size: 32,
          color: Colors.white,
        ),
        SizedBox(
          width: 1.h,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Lokasi Perangkat',
              style: GoogleFonts.poppins(fontSize: 12, color: Colors.white),
            ),
            Text(
              currentLocation,
              style: GoogleFonts.poppins(
                color: Colors.white,
              ),
            )
          ],
        )
      ],
    );
  }
}

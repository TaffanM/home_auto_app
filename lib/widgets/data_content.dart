import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DataContent extends StatelessWidget {
  const DataContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Monitoring',
          style: GoogleFonts.poppins(
              fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        SizedBox(
          height: 1.h,
        ),
        Container(
          padding: EdgeInsets.all(2.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2.h),
              color: Color(0xFFD9D9D9)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  child: Row(
                children: [
                  Icon(
                    Icons.device_thermostat_outlined,
                    size: 32,
                  ),
                  SizedBox(
                    width: 1.h,
                  ),
                  Expanded(
                      child: Text(
                    "Suhu Ruangan",
                    style: GoogleFonts.poppins(fontSize: 16),
                  )),
                  Text(
                    '31\u00B0',
                    style: GoogleFonts.poppins(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  )
                ],
              )),
              Divider(),
              Container(
                  child: Row(
                children: [
                  Icon(
                    Icons.light_mode,
                    size: 32,
                  ),
                  SizedBox(
                    width: 1.h,
                  ),
                  Expanded(
                      child: Text(
                    "Intensitas Cahaya",
                    style: GoogleFonts.poppins(fontSize: 16),
                  )),
                  Text(
                    '978',
                    style: GoogleFonts.poppins(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  )
                ],
              )),
            ],
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        Text(
          'Daftar Perangkat',
          style: GoogleFonts.poppins(
              fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        SizedBox(
          height: 1.h,
        ),
        Row(
          children: [
            Expanded(
                child: ItemDevice(
              deviceName: 'Kipas Kematian',
              assetPath: 'assets/images/kipas.png',
              onSwitch: (value) {},
            )),
            SizedBox(
              width: 2.h,
            ),
            Expanded(
                child: ItemDevice(
              deviceName: 'Cahaya Ilahi',
              assetPath: 'assets/images/lampu.png',
              onSwitch: (value) {},
            )),
          ],
        ),
        SizedBox(height: 5.h)
      ],
    );
  }
}

class ItemDevice extends StatefulWidget {
  const ItemDevice(
      {super.key,
      required this.onSwitch,
      required this.assetPath,
      required this.deviceName});
  final String assetPath;
  final String deviceName;
  final Function(bool value) onSwitch;

  @override
  State<ItemDevice> createState() => _ItemDeviceState();
}

class _ItemDeviceState extends State<ItemDevice> {
  var _isOn = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(2.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2.h), color: Color(0xFFD9D9D9)),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  widget.assetPath,
                  width: 4.h,
                  height: 4.h,
                ),
                SizedBox(
                  width: 1.h,
                ),
                Expanded(
                    child: Text(
                  widget.deviceName,
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500, fontSize: 16),
                ))
              ],
            ),
            Divider(height: 4.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Status'),
                Text('\u2022'),
                Switch(
                  value: _isOn,
                  activeColor: Colors.green,
                  onChanged: (value) {
                    setState(() {
                      _isOn = value;
                    });

                    widget.onSwitch(_isOn);
                  },
                )
              ],
            )
          ],
        ));
  }
}

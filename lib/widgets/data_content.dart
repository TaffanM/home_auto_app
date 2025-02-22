import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_automation/model/model_device.dart';
import 'package:home_automation/providers/device_provider.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math';

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
          style: GoogleFonts.bebasNeue(
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
                    style: GoogleFonts.bebasNeue(fontSize: 16),
                  )),
                  Text(
                    '31\u00B0',
                    style: GoogleFonts.bebasNeue(
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
                    style: GoogleFonts.bebasNeue(fontSize: 16),
                  )),
                  Text(
                    '978',
                    style: GoogleFonts.bebasNeue(
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
          style: GoogleFonts.bebasNeue(
              fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        SizedBox(
          height: 1.h,
        ),
        Consumer<DeviceProvider>(
          builder: (context, prov, child) {
            if (prov.deviceList == null || prov.deviceList!.isEmpty) {
              if (prov.onSearch) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              return Container(
                width: double.infinity,
                padding: EdgeInsets.all(2.h),
                decoration: BoxDecoration(
                    color: Color(0xFFD9D9D9),
                    borderRadius: BorderRadius.circular(2.h)),
                child: Column(
                  children: [
                    Text('Data tidak ditemukan'),
                    OutlinedButton(
                        onPressed: () {
                          prov.getDevice();
                        },
                        child: Text('Muat Ulang'))
                  ],
                ),
              );
            }

            return GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 2.h,
                mainAxisSpacing: 2.h,
              ),
              itemCount: prov.deviceList!.length,
              itemBuilder: (context, index) {
                var dvc = prov.deviceList![index];

                return ItemDevice(onSwitch: (value) {}, data: dvc);
              },
            );
          },
        ),
        SizedBox(height: 5.h)
      ],
    );
  }
}

class ItemDevice extends StatefulWidget {
  const ItemDevice({
    super.key,
    required this.onSwitch,
    required this.data,
  });
  final DeviceModel data;
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
                  widget.data.deviceAsset,
                  width: 4.h,
                  height: 4.h,
                ),
                SizedBox(
                  width: 1.h,
                ),
                Expanded(
                    child: Text(
                  widget.data.deviceNama,
                  style: GoogleFonts.bebasNeue(
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
                Transform.rotate(
                  angle: pi/2,
                  child: CupertinoSwitch(
                    value: _isOn,
                    activeColor: Colors.green,
                    onChanged: (value) {
                      setState(() {
                        _isOn = value;
                      });

                      widget.onSwitch(_isOn);
                    },
                  ),
                ) 
              ],
            )
          ],
        ));
  }
}

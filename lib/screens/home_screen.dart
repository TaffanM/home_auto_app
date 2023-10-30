import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_automation/widgets/clock_content.dart';
import 'package:home_automation/widgets/data_content.dart';
import 'package:home_automation/widgets/statistik_chart.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, type) {
      return Scaffold(
        backgroundColor: Colors.blueGrey,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 2.h),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF232333),
                Color(0xFF5F5F82)
              ], // Replace with your own colors
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SafeArea(
            child: ListView(
              padding: EdgeInsets.zero,
              physics: BouncingScrollPhysics(),
              children: [
                ClockContent(),
                _locationWidget(),
                SizedBox(
                  height: 2.h,
                ),
                StatistikChart(),
                SizedBox(
                  height: 2.h,
                ),
                DataContent()
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _locationWidget() {
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
              'Jl. Cikutra No.131B, Bandung',
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

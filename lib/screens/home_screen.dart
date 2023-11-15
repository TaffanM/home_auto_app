import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_automation/providers/device_provider.dart';
import 'package:home_automation/widgets/clock_content.dart';
import 'package:home_automation/widgets/data_content.dart';
import 'package:home_automation/widgets/home_location.dart';
import 'package:home_automation/widgets/statistik_chart.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

  void refresh(context) {
    DeviceProvider.instance(context).getDevice();
  }

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
                Color(0xFF9d7463),
                Color(0xFFA57A68),
              ], // Replace with your own colors
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SafeArea(
            child: RefreshIndicator(
              onRefresh: () async {
                refresh(context);
              },
              child: ListView(
                padding: EdgeInsets.zero,
                physics: BouncingScrollPhysics(),
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/images/menu.png',
                          height: 45,
                          color: Colors.white,
                        ),
                        // account icon
                        Icon(
                          Icons.person,
                          size: 45,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  ClockContent(),
                  HomeLocation(),
                  SizedBox(
                    height: 2.h,
                  ),
                  StatistikChart(),
                  SizedBox(
                    height: 2.h,
                  ),
                  DataContent(),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}

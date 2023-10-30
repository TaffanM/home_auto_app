import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class StatistikChart extends StatelessWidget {
  const StatistikChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25.h,
      padding: EdgeInsets.all(2.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.h), color: Color(0xFFd9d9d9)),
      child: Center(
        child: Text('Statistik'),
      ),
    );
  }
}

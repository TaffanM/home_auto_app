import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:google_fonts/google_fonts.dart';

class ClockContent extends StatefulWidget {
  const ClockContent({super.key});

  @override
  State<ClockContent> createState() => _ClockContentState();
}

class _ClockContentState extends State<ClockContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 2.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('18:41',
              style: GoogleFonts.poppins(color: Colors.white, fontSize: 48)),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Mostly sunny 31\u00B0',
                style: GoogleFonts.poppins(fontSize: 16, color: Colors.white),
              ),
              Text(
                'Thu, Oct 26',
                style: GoogleFonts.poppins(fontSize: 20, color: Colors.white),
              )
            ],
          ),
        ],
      ),
    );
  }
}

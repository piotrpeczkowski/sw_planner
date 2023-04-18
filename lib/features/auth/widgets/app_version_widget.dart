import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppVersionWidget extends StatelessWidget {
  const AppVersionWidget({
    super.key,
    required this.appVersion,
  });

  final String appVersion;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.05,
      right: 15,
      child: Text(
        appVersion,
        style: GoogleFonts.lato(
          color: Colors.white.withOpacity(0.3),
          fontSize: 12,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}

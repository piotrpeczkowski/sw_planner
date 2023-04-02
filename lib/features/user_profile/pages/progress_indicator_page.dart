import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProgressIndicatorPage extends StatelessWidget {
  const ProgressIndicatorPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profil użytkownika',
          style: GoogleFonts.kanit(),
        ),
      ),
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

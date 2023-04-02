import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsWidget extends StatelessWidget {
  const SettingsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.settings),
      title: Text(
        'Ustawienia',
        style: GoogleFonts.lato(fontSize: 16),
      ),
      onTap: () {},
    );
  }
}

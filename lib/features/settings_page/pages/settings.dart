import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ustawienia', style: GoogleFonts.kanit()),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.chevron_right),
            title: Text(
              'Zmień hasło',
              style: GoogleFonts.lato(),
            ),
            onTap: () {},
          )
        ],
      ),
    );
  }
}

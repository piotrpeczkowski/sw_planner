import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sw_planner/features/settings_page/widgets/change_password_widget.dart';

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
        children: const [
          ChangePasswordWidget(),
        ],
      ),
    );
  }
}

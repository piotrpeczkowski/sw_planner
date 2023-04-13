import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sw_planner/features/settings_page/widgets/change_password_widget.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({
    super.key,
  });

//TODO: Add change password option
//TODO: Add delete account with all user data
//TODO: Add email verification sender

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

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sw_planner/features/calendar_page/pages/calendar_page.dart';

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.calendar_month),
      title: Text(
        'Kalendarz',
        style: GoogleFonts.lato(fontSize: 16),
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => CalendarPage(),
          ),
        );
      },
    );
  }
}

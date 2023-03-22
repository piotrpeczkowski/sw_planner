import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CalendarPageBody();
  }
}

class CalendarPageBody extends StatelessWidget {
  const CalendarPageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalendarz', style: GoogleFonts.kanit()),
        actions: const [
          // IconButton(
          //   onPressed: onSave,
          //   tooltip: 'Zapisz',
          //   icon: const Icon(Icons.done),
          // ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TableCalendar(
              locale: 'pl_PL',
              firstDay: DateTime.utc(2021, 01, 01),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: DateTime.utc(2023, 03, 23),
              currentDay: DateTime.now(),
              startingDayOfWeek: StartingDayOfWeek.monday,
              headerStyle: const HeaderStyle(
                titleCentered: true,
                formatButtonVisible: false,
              ),
              calendarStyle: CalendarStyle(
                defaultTextStyle: GoogleFonts.lato(),
                todayDecoration: const BoxDecoration(
                  color: Color.fromARGB(220, 84, 152, 255),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          const Divider(thickness: 1),
        ],
      ),
    );
  }
}

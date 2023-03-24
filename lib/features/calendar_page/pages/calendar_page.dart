import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  CalendarPage({super.key});

  final DateTime currentDay = DateTime.now();
  final CalendarFormat calendarFormat = CalendarFormat.month;

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return CalendarPageBody(
      calendarFormat: widget.calendarFormat,
      currentDay: widget.currentDay,
      selectedDay: _selectedDay,
      focusedDay: _focusedDay,
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _selectedDay = selectedDay;
          _focusedDay = focusedDay;
        });
      },
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay, day);
      },
      onPageChanged: (focusedDay) {
        _focusedDay = focusedDay;
      },
    );
  }
}

class CalendarPageBody extends StatelessWidget {
  const CalendarPageBody({
    required this.calendarFormat,
    required this.selectedDay,
    required this.focusedDay,
    required this.currentDay,
    required this.onDaySelected,
    required this.selectedDayPredicate,
    required this.onPageChanged,
    super.key,
  });

  final CalendarFormat calendarFormat;
  final DateTime selectedDay;
  final DateTime focusedDay;
  final DateTime currentDay;
  final void Function(DateTime, DateTime) onDaySelected;
  final bool Function(DateTime) selectedDayPredicate;
  final void Function(DateTime) onPageChanged;

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
              calendarFormat: calendarFormat,
              firstDay: DateTime.utc(2021, 01, 01),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: focusedDay,
              currentDay: currentDay,
              startingDayOfWeek: StartingDayOfWeek.monday,
              selectedDayPredicate: selectedDayPredicate,
              onDaySelected: onDaySelected,
              onPageChanged: onPageChanged,
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

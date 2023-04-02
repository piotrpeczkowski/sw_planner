import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sw_planner/features/tasks_page/pages/tasks.dart';

class TasksWidget extends StatelessWidget {
  const TasksWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.task_alt),
      title: Text(
        'Zadania',
        style: GoogleFonts.lato(fontSize: 16),
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const TasksPage(),
          ),
        );
      },
    );
  }
}

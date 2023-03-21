import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskPriorityDropdownList extends StatelessWidget {
  const TaskPriorityDropdownList({
    super.key,
    required this.taskPriorityValue,
    required this.onPriorityChanged,
  });

  final String taskPriorityValue;
  final void Function(String?) onPriorityChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: taskPriorityValue,
      decoration: InputDecoration(
        label: Text(
          'Priorytet zadania',
          style: GoogleFonts.lato(),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Color.fromARGB(255, 13, 71, 161),
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      style: GoogleFonts.lato(
        fontSize: 15,
        color: const Color.fromARGB(255, 13, 71, 161),
      ),
      items: [
        DropdownMenuItem(
          enabled: false,
          value: '',
          child: Text(
            'Ustaw Priorytet',
            style: GoogleFonts.lato(color: Colors.black54),
          ),
        ),
        DropdownMenuItem(
          value: 'Niski',
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Container(
                  width: 14,
                  height: 14,
                  color: Colors.green,
                ),
              ),
              const Text('Priorytet: Niski'),
            ],
          ),
        ),
        DropdownMenuItem(
          value: 'Średni',
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Container(
                  width: 14,
                  height: 14,
                  color: Colors.yellow,
                ),
              ),
              const Text('Priorytet: Średni'),
            ],
          ),
        ),
        DropdownMenuItem(
          value: 'Wysoki',
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Container(
                  width: 14,
                  height: 14,
                  color: Colors.red,
                ),
              ),
              const Text('Priorytet: Wysoki'),
            ],
          ),
        ),
      ],
      onChanged: onPriorityChanged,
    );
  }
}

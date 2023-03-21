import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeadlineTimePicker extends StatelessWidget {
  const DeadlineTimePicker({
    required this.taskTimeController,
    required this.taskTimeFocusNode,
    required this.onDeadlineTimeChanged,
    required this.selectedTime,
    super.key,
  });

  final TextEditingController taskTimeController;
  final FocusNode taskTimeFocusNode;
  final void Function() onDeadlineTimeChanged;
  final DateTime selectedTime;

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true,
      controller: taskTimeController,
      focusNode: taskTimeFocusNode,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        label: Text(
          'Planowana godzina zakończenia',
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
      onTap: onDeadlineTimeChanged,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeadlineDatePicker extends StatelessWidget {
  const DeadlineDatePicker({
    required this.taskDateController,
    required this.taskDateFocusNode,
    required this.onDeadlineDateChanged,
    required this.selectedDate,
    super.key,
  });

  final TextEditingController taskDateController;
  final FocusNode taskDateFocusNode;
  final void Function() onDeadlineDateChanged;
  final DateTime selectedDate;

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true,
      controller: taskDateController,
      focusNode: taskDateFocusNode,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        label: Text(
          'Planowana data zakończenia',
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
      onTap: onDeadlineDateChanged,
    );
  }
}

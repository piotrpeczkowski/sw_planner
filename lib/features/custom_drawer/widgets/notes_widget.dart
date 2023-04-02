import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sw_planner/features/notes_page/pages/notes.dart';

class NotesWidget extends StatelessWidget {
  const NotesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.notes_outlined),
      title: Text(
        'Notatki',
        style: GoogleFonts.lato(fontSize: 16),
      ),
      onTap: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const NotesPage(),
          ),
        );
      },
    );
  }
}

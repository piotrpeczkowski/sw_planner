import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sw_planner/features/add_note/pages/add_note.dart';
import 'package:sw_planner/features/notes_page/widgets/note_widget.dart';
import 'package:sw_planner/features/custom_drawer/custom_drawer.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notatki', style: GoogleFonts.kanit()),
      ),
      drawer: const CustomDrawer(),
      floatingActionButton: AddNoteButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddNote(),
            ),
          );
        },
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        fit: StackFit.expand,
        children: [
          ListView(
            children: const [
              NoteWidget(),
              NoteWidget(),
              NoteWidget(),
              NoteWidget(),
              NoteWidget(),
              SizedBox(height: 100),
            ],
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.15,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.white,
                    Colors.white70,
                    Colors.white.withOpacity(0.02)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AddNoteButton extends StatelessWidget {
  const AddNoteButton({
    required this.onPressed,
    super.key,
  });

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: FloatingActionButton(
        onPressed: onPressed,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddNote extends StatelessWidget {
  AddNote({super.key});

  final TextEditingController _noteTitleController = TextEditingController();
  final TextEditingController _noteContentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AddNoteBody(
      noteTitleController: _noteTitleController,
      noteContentController: _noteContentController,
      onSave: () {
        Navigator.of(context).pop();
      },
    );
  }
}

class AddNoteBody extends StatelessWidget {
  const AddNoteBody({
    super.key,
    required this.noteTitleController,
    required this.noteContentController,
    required this.onSave,
  });

  final TextEditingController noteTitleController;
  final TextEditingController noteContentController;
  final Function() onSave;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dodaj notatkę', style: GoogleFonts.kanit()),
        actions: [
          IconButton(
            onPressed: onSave,
            tooltip: 'Zapisz',
            icon: const Icon(Icons.done),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          TextField(
            controller: noteTitleController,
            keyboardType: TextInputType.multiline,
            minLines: 1,
            maxLines: 3,
            maxLength: 120,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              label: Text(
                'Tytuł notatki',
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
          ),
          TextField(
            controller: noteContentController,
            keyboardType: TextInputType.multiline,
            minLines: 10,
            maxLines: 15,
            maxLength: 600,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              label: Text(
                'Treść notatki',
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
          ),
        ],
      ),
    );
  }
}

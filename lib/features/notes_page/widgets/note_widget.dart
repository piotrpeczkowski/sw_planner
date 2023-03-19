import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NoteWidget extends StatefulWidget {
  const NoteWidget({
    super.key,
  });

  @override
  State<NoteWidget> createState() => _NoteWidgetState();
}

class _NoteWidgetState extends State<NoteWidget> {
  bool isNoteDescriptionTapped = false;
  bool isNoteTitleTapped = false;
  int noteDescriptionMaxLines = 3;
  int noteTitleMaxLines = 1;
  @override
  Widget build(BuildContext context) {
    return NoteWidgetBody(
      noteId: '',
      noteTitle: 'Przykładowy tytuł notatki',
      noteEditDate: '10.03.2023',
      noteDeadlineDate: '31.03.2023, 15:00',
      notePriority: 'Niski',
      noteDescription:
          'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.',
      noteDescriptionMaxLines: noteDescriptionMaxLines,
      noteTitleMaxLines: noteTitleMaxLines,
      onNoteDescriptionTap: () {
        setState(() {
          if (isNoteDescriptionTapped == false) {
            isNoteDescriptionTapped = true;
            isNoteTitleTapped = true;
            noteDescriptionMaxLines = 15;
            noteTitleMaxLines = 3;
          } else {
            isNoteDescriptionTapped = false;
            isNoteTitleTapped = false;
            noteDescriptionMaxLines = 3;
            noteTitleMaxLines = 1;
          }
        });
      },
      onNoteTitleTap: () {
        setState(() {
          if (isNoteTitleTapped == false) {
            isNoteTitleTapped = true;
            isNoteDescriptionTapped = true;
            noteTitleMaxLines = 3;
            noteDescriptionMaxLines = 15;
          } else {
            isNoteTitleTapped = false;
            isNoteDescriptionTapped = false;
            noteTitleMaxLines = 1;
            noteDescriptionMaxLines = 3;
          }
        });
      },
    );
  }
}

class NoteWidgetBody extends StatelessWidget {
  const NoteWidgetBody({
    required this.noteId,
    required this.noteTitle,
    required this.noteEditDate,
    required this.noteDeadlineDate,
    required this.notePriority,
    required this.noteDescription,
    required this.noteDescriptionMaxLines,
    required this.noteTitleMaxLines,
    required this.onNoteDescriptionTap,
    required this.onNoteTitleTap,
    super.key,
  });

  final String noteId;
  final String noteTitle;
  final String noteEditDate;
  final String noteDeadlineDate;
  final String notePriority;
  final String noteDescription;
  final int noteDescriptionMaxLines;
  final int noteTitleMaxLines;
  final Function() onNoteDescriptionTap;
  final Function() onNoteTitleTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            right: 15,
            top: 15,
            bottom: 1,
          ),
          child: Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                color: Color.fromARGB(255, 13, 71, 161),
              ),
              child: Text(
                'Ostatnia aktualizacja: $noteEditDate',
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 13,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                spreadRadius: 0.2,
                blurRadius: 1.0,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Column(
            children: [
              GestureDetector(
                onTap: onNoteTitleTap,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [
                        Color.fromARGB(255, 13, 71, 161),
                        Color.fromARGB(255, 84, 152, 255),
                      ],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 5),
                        child: Text(
                          noteTitle,
                          overflow: TextOverflow.ellipsis,
                          maxLines: noteTitleMaxLines,
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: onNoteDescriptionTap,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            noteDescription,
                            style: GoogleFonts.lato(),
                            overflow: TextOverflow.ellipsis,
                            maxLines: noteDescriptionMaxLines,
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                    const Divider(thickness: 1.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text('Edytuj', style: GoogleFonts.kanit()),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text('Usuń',
                              style: GoogleFonts.kanit(color: Colors.red)),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

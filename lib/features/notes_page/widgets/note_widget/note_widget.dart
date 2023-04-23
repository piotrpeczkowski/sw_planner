import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sw_planner/core/enums.dart';
import 'package:sw_planner/features/notes_page/widgets/note_widget/cubit/note_widget_cubit.dart';

class NoteWidget extends StatelessWidget {
  const NoteWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteWidgetCubit(),
      child: BlocConsumer<NoteWidgetCubit, NoteWidgetState>(
        listener: (context, state) {
          if (state.status == Status.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: const Duration(seconds: 4),
                backgroundColor: Colors.red,
                content: Text(state.errorMessage),
              ),
            );
          }
        },
        builder: (context, state) {
          final isNoteContainerExpanded = state.isExpanded;
          return NoteWidgetBody(
            noteId: '',
            noteTitle: 'Przykładowy tytuł notatki',
            noteEditDate: '10.03.2023',
            noteDeadlineDate: '31.03.2023, 15:00',
            notePriority: 'Niski',
            noteDescription:
                'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.',
            isNoteContainerExpanded: isNoteContainerExpanded,
            onNoteContainerTap: () {
              context.read<NoteWidgetCubit>().changeContainerExpansion(
                    isNoteContainerExpanded: isNoteContainerExpanded,
                  );
            },
          );
        },
      ),
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
    required this.onNoteContainerTap,
    required this.isNoteContainerExpanded,
    super.key,
  });

  final String noteId;
  final String noteTitle;
  final String noteEditDate;
  final String noteDeadlineDate;
  final String notePriority;
  final String noteDescription;
  final Function() onNoteContainerTap;
  final bool isNoteContainerExpanded;

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
                  color: Color.fromARGB(255, 13, 71, 161)),
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
        GestureDetector(
          onTap: onNoteContainerTap,
          child: Container(
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
                Container(
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
                        Color.fromARGB(255, 84, 152, 255)
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
                          maxLines: isNoteContainerExpanded ? 3 : 1,
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
                Container(
                  padding: const EdgeInsets.all(10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    color: isNoteContainerExpanded
                        ? const Color.fromARGB(255, 220, 239, 255)
                        : Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            noteDescription,
                            style: GoogleFonts.lato(),
                            overflow: TextOverflow.ellipsis,
                            maxLines: isNoteContainerExpanded ? 15 : 3,
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                      Visibility(
                        visible: isNoteContainerExpanded,
                        child: Column(
                          children: [
                            const Divider(thickness: 1.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  child: Text('Edytuj',
                                      style: GoogleFonts.kanit()),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text('Usuń',
                                      style:
                                          GoogleFonts.kanit(color: Colors.red)),
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
            ),
          ),
        ),
      ],
    );
  }
}

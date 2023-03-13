import 'package:flutter/material.dart';
import 'package:sw_planner/features/add_note/pages/add_note.dart';
import 'package:sw_planner/features/widgets/custom_drawer.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notatki'),
      ),
      drawer: const CustomDrawer(),
      floatingActionButton: AddNoteButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AddNote(),
            ),
          );
        },
      ),
      body: const Center(
        child: Text('Notatki'),
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

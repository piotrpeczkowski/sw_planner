import 'package:flutter/material.dart';
import 'package:sw_planner/custom_drawer.dart';

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
      body: const Center(
        child: Text('Notatki'),
      ),
    );
  }
}

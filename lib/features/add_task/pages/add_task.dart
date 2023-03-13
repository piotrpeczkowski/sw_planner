import 'package:flutter/material.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nowe zadanie'),
      ),
      body: const Center(
        child: Text('Nowe zadanie'),
      ),
    );
  }
}

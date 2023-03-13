import 'package:flutter/material.dart';
import 'package:sw_planner/custom_drawer.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zadania'),
      ),
      drawer: const CustomDrawer(),
      body: const Center(
        child: Text('Zadania'),
      ),
    );
  }
}

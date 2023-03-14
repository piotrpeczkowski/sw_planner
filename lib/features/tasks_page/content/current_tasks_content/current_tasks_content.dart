import 'package:flutter/material.dart';
import 'package:sw_planner/features/tasks_page/widgets/task_widget.dart';

class CurrentTasksContent extends StatelessWidget {
  const CurrentTasksContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        //Text('Zadania bieżące'),
        TaskWidget(),
        TaskWidget(),
      ],
    );
  }
}

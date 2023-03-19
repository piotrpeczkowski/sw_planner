import 'package:flutter/material.dart';
import 'package:sw_planner/features/tasks_page/widgets/task_widget.dart';

class CurrentTasksContent extends StatelessWidget {
  const CurrentTasksContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      fit: StackFit.expand,
      children: [
        ListView(
          children: const [
            TaskWidget(),
            TaskWidget(),
            TaskWidget(),
            SizedBox(height: 50),
          ],
        ),
        Positioned(
          bottom: 0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.07,
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
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sw_planner/core/enums.dart';
import 'package:sw_planner/features/add_task/pages/add_task_demo.dart';
import 'package:sw_planner/features/tasks_page/content/current_tasks/current_tasks_content.dart';
import 'package:sw_planner/features/tasks_page/content/ended_tasks/ended_tasks_content.dart';
import 'package:sw_planner/features/tasks_page/cubit/tasks_cubit.dart';
import 'package:sw_planner/features/tasks_page/widgets/add_task_button_widget.dart';
import 'package:sw_planner/features/tasks_page/widgets/task_bottom_nav_bar_widget.dart';
import 'package:sw_planner/features/custom_drawer/custom_drawer.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TasksCubit(),
      child: BlocConsumer<TasksCubit, TasksState>(
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
          final currentIndex = state.currentIndex;
          final tasksList = state.tasksList;
          return Scaffold(
            appBar: AppBar(
              title: Text('Zadania', style: GoogleFonts.kanit()),
            ),
            bottomNavigationBar: TaskBottomNavBar(
              currentIndex: currentIndex,
              onTap: (newIndex) {
                context.read<TasksCubit>().setCurrentIndex(
                      index: newIndex,
                    );
              },
            ),
            drawer: const CustomDrawer(),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: Visibility(
              visible: currentIndex == 0 ? true : false,
              child: AddTaskButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AddTask(),
                    ),
                  );
                },
              ),
            ),
            body: Builder(
              builder: (context) {
                switch (tasksList) {
                  case TasksList.current:
                    return const CurrentTasks();
                  case TasksList.ended:
                    return const EndedTasks();
                }
              },
            ),
          );
        },
      ),
    );
  }
}

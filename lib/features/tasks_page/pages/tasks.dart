import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sw_planner/data/repositories/user_repository.dart';
import 'package:sw_planner/features/add_task/pages/add_task.dart';
import 'package:sw_planner/features/tasks_page/content/current_tasks/current_tasks_content.dart';
import 'package:sw_planner/features/tasks_page/content/ended_tasks/ended_tasks_content.dart';
import 'package:sw_planner/features/tasks_page/widgets/add_task_button_widget.dart';
import 'package:sw_planner/features/tasks_page/widgets/task_bottom_nav_bar_widget.dart';
import 'package:sw_planner/features/user_profile/cubit/profile_cubit.dart';
import 'package:sw_planner/features/custom_drawer/custom_drawer.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({
    super.key,
  });

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(UserRepository())..start(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Zadania', style: GoogleFonts.kanit()),
        ),
        bottomNavigationBar: TaskBottomNavBar(
          currentIndex: _currentIndex,
          onTap: (value) {
            setState(() {
              _currentIndex = value;
            });
          },
        ),
        drawer: const CustomDrawer(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Visibility(
          visible: _currentIndex == 0 ? true : false,
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
            if (_currentIndex == 0) {
              return const CurrentTasks();
            }
            return const EndedTasks();
          },
        ),
      ),
    );
  }
}

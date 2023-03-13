import 'package:flutter/material.dart';
import 'package:sw_planner/features/add_task/pages/add_task.dart';
import 'package:sw_planner/features/widgets/custom_drawer.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zadania'),
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
                builder: (context) => const AddTask(),
              ),
            );
          },
        ),
      ),
      body: Builder(builder: (context) {
        if (_currentIndex == 0) {
          return const Center(
            child: Text('Zadania bieżące'),
          );
        }
        return const Center(
          child: Text('Zadania zakończone'),
        );
      }),
    );
  }
}

class AddTaskButton extends StatelessWidget {
  const AddTaskButton({
    required this.onPressed,
    super.key,
  });

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: const Icon(Icons.add),
    );
  }
}

class TaskBottomNavBar extends StatelessWidget {
  const TaskBottomNavBar({
    required this.currentIndex,
    required this.onTap,
    super.key,
  });

  final int currentIndex;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.list_alt),
          label: 'Bieżące',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.done_all),
          label: 'Zakończone',
        ),
      ],
    );
  }
}

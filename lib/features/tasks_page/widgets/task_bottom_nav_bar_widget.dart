import 'package:flutter/material.dart';

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
          icon: Icon(Icons.done),
          label: 'Zakończone',
        ),
      ],
    );
  }
}

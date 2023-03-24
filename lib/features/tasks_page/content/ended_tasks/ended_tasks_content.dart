import 'package:flutter/material.dart';

class EndedTasks extends StatelessWidget {
  const EndedTasks({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        Center(
            child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Text('Zakończone zadania'),
        )),
      ],
    );
  }
}

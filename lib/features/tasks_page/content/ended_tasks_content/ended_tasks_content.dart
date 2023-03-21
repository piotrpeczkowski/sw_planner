import 'package:flutter/material.dart';

class EndedTasksContent extends StatelessWidget {
  const EndedTasksContent({
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

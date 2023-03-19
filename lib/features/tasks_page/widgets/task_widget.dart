import 'package:flutter/material.dart';

class TaskWidget extends StatefulWidget {
  const TaskWidget({
    super.key,
  });

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  bool isTaskDescriptionTapped = false;
  bool isTaskTitleTapped = false;
  int taskDescriptionMaxLines = 3;
  int taskTitleMaxLines = 1;
  @override
  Widget build(BuildContext context) {
    return TaskWidgetBody(
      taskId: '',
      taskTitle: 'Przykładowy tytuł taska',
      taskEditDate: '10.03.2023',
      taskDeadlineDate: '31.03.2023, 15:00',
      taskPriority: 'Niski',
      taskDescription:
          'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.',
      taskDescriptionMaxLines: taskDescriptionMaxLines,
      taskTitleMaxLines: taskTitleMaxLines,
      onTaskDescriptionTap: () {
        setState(() {
          if (isTaskDescriptionTapped == false) {
            isTaskDescriptionTapped = true;
            isTaskTitleTapped = true;
            taskDescriptionMaxLines = 15;
            taskTitleMaxLines = 3;
          } else {
            isTaskDescriptionTapped = false;
            isTaskTitleTapped = false;
            taskDescriptionMaxLines = 3;
            taskTitleMaxLines = 1;
          }
        });
      },
      onTaskTitleTap: () {
        setState(() {
          if (isTaskTitleTapped == false) {
            isTaskTitleTapped = true;
            isTaskDescriptionTapped = true;
            taskTitleMaxLines = 3;
            taskDescriptionMaxLines = 15;
          } else {
            isTaskTitleTapped = false;
            isTaskDescriptionTapped = false;
            taskTitleMaxLines = 1;
            taskDescriptionMaxLines = 3;
          }
        });
      },
    );
  }
}

class TaskWidgetBody extends StatelessWidget {
  const TaskWidgetBody({
    required this.taskId,
    required this.taskTitle,
    required this.taskEditDate,
    required this.taskDeadlineDate,
    required this.taskPriority,
    required this.taskDescription,
    required this.taskDescriptionMaxLines,
    required this.taskTitleMaxLines,
    required this.onTaskDescriptionTap,
    required this.onTaskTitleTap,
    super.key,
  });

  final String taskId;
  final String taskTitle;
  final String taskEditDate;
  final String taskDeadlineDate;
  final String taskPriority;
  final String taskDescription;
  final int taskDescriptionMaxLines;
  final int taskTitleMaxLines;
  final Function() onTaskDescriptionTap;
  final Function() onTaskTitleTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            right: 15,
            top: 15,
            bottom: 1,
          ),
          child: Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                color: Color.fromARGB(255, 13, 71, 161),
              ),
              child: Text(
                'Ostatnia aktualizacja: $taskEditDate',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                spreadRadius: 0.2,
                blurRadius: 1.0,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Column(
            children: [
              GestureDetector(
                onTap: onTaskTitleTap,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [
                        Color.fromARGB(255, 13, 71, 161),
                        Color.fromARGB(255, 84, 152, 255),
                      ],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 5),
                        child: Text(
                          taskTitle,
                          overflow: TextOverflow.ellipsis,
                          maxLines: taskTitleMaxLines,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Termin wykonania:'),
                        Text(taskDeadlineDate),
                      ],
                    ),
                    const Divider(thickness: 1.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Priorytet:'),
                        Row(
                          children: [
                            Text(taskPriority),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Container(
                                width: 14,
                                height: 14,
                                color: taskPriority == 'Wysoki'
                                    ? Colors.red
                                    : taskPriority == 'Średni'
                                        ? Colors.yellow
                                        : Colors.green,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Divider(thickness: 1.0),
                    GestureDetector(
                      onTap: onTaskDescriptionTap,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Opis zadania:'),
                          const Padding(padding: EdgeInsets.only(top: 10)),
                          Text(
                            taskDescription,
                            overflow: TextOverflow.ellipsis,
                            maxLines: taskDescriptionMaxLines,
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                    const Divider(thickness: 1.0),
                    TextButton(onPressed: () {}, child: const Text('Edytuj'))
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

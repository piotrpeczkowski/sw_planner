import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskWidget extends StatefulWidget {
  const TaskWidget({
    super.key,
  });

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  Color _taskDetailsContainerColor = Colors.white;
  bool _isTaskContainerExpanded = false;
  int _taskDescriptionMaxLines = 3;
  int _taskTitleMaxLines = 1;
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
      taskDescriptionMaxLines: _taskDescriptionMaxLines,
      taskTitleMaxLines: _taskTitleMaxLines,
      taskDetailsContainerColor: _taskDetailsContainerColor,
      isTaskContainerExpanded: _isTaskContainerExpanded,
      onTaskContainerTap: () {
        setState(() {
          if (_isTaskContainerExpanded == false) {
            _taskDetailsContainerColor =
                const Color.fromARGB(255, 220, 239, 255);
            _isTaskContainerExpanded = true;
            _taskDescriptionMaxLines = 15;
            _taskTitleMaxLines = 3;
          } else {
            _taskDetailsContainerColor = Colors.white;
            _isTaskContainerExpanded = false;
            _taskDescriptionMaxLines = 3;
            _taskTitleMaxLines = 1;
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
    required this.onTaskContainerTap,
    required this.isTaskContainerExpanded,
    required this.taskDetailsContainerColor,
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
  final Function() onTaskContainerTap;
  final bool isTaskContainerExpanded;
  final Color taskDetailsContainerColor;

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
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 13,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: onTaskContainerTap,
          child: Container(
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
                Container(
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
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    color: taskDetailsContainerColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Termin wykonania:', style: GoogleFonts.lato()),
                          Text(taskDeadlineDate, style: GoogleFonts.lato()),
                        ],
                      ),
                      const Divider(thickness: 1.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Priorytet:', style: GoogleFonts.lato()),
                          Row(
                            children: [
                              Text(taskPriority, style: GoogleFonts.lato()),
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Opis zadania:', style: GoogleFonts.lato()),
                          const Padding(padding: EdgeInsets.only(top: 10)),
                          Text(
                            taskDescription,
                            style: GoogleFonts.lato(),
                            overflow: TextOverflow.ellipsis,
                            maxLines: taskDescriptionMaxLines,
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                      Visibility(
                        visible: isTaskContainerExpanded,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Divider(thickness: 1.0),
                            TextButton(
                              onPressed: () {},
                              child: Text('Edytuj', style: GoogleFonts.kanit()),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
